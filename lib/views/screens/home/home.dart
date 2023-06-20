import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:nearby_me/views/extensions/space_xy_extension.dart';

import '../../../helpers/home_screen/home_controller.dart';
import '../../../views/screens/home/local_widgets/stores_list.dart';
import '../../widgets/api_error_handling.dart';
import '../../widgets/loading_content.dart';
import 'local_widgets/not_found_any_result.dart';
import 'local_widgets/search_result_title.dart';
import 'local_widgets/waiting_for_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHighlighted = true;

  HomeController homeController = Get.put<HomeController>(HomeController());

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 9.0,
                vertical: 5,
              ),
              child: Text(
                'Search & find out your around...',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      autofocus: true,
                      onChanged: homeController.updateQuery,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        hintStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.4)),
                        hintText: 'Exp: London, Amsterdam, ...',
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            width: 2,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                  5.0.spaceX,
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onHighlightChanged: (value) {
                      setState(() {
                        isHighlighted = !isHighlighted;
                      });
                    },
                    onTap: () async {
                      final String location = await getLocation();
                      if (location.contains('permission') ||
                          location.contains('access')) {
                        Get.defaultDialog(middleText: location);
                      } else {
                        _searchController.text = '';
                        _searchController.text = location;
                        await homeController.updateQuery(location);
                      }
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 300),
                      height: isHighlighted ? 48 : 43,
                      width: isHighlighted ? 48 : 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(.5),
                            offset: const Offset(5, 10),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: isHighlighted ? 33 : 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<HomeController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return const LoadingContents();
                }
                if (controller.errorMessage.isNotEmpty) {
                  return ApiErrorHandling(
                    errorMessage: controller.errorMessage,
                  );
                } else if (controller.storesList.isEmpty &&
                    controller.errorMessage.isEmpty) {
                  return controller.searchQuery.isEmpty
                      ? const WaitingForSearch()
                      : const NotFoundAnyResult();
                } else {
                  return Column(
                    children: [
                      SearchResultTitle(
                        cityName: controller.searchQuery,
                      ),
                      StoresList(
                        storesList: controller.storesList,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getLocation() async {
    try {
      final permission = await Geolocator.requestPermission();

      Future<String> permissionAccepted() async {
        final position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.low)
            .timeout(
          const Duration(seconds: 10),
        );

        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        log(placemarks.first.locality.toString());

        return placemarks.first.locality.toString();
      }

      switch (permission) {
        case LocationPermission.denied:
          return 'Location permission denied\nplease change permission status on app setting.';
        case LocationPermission.deniedForever:
          return 'Location permission denied forever\nplease change permission status on app setting.';
        case LocationPermission.always:
          return permissionAccepted();
        case LocationPermission.whileInUse:
          return permissionAccepted();

        default:
          'Can\'t access to your location';
      }

      return 'Can\'t access to your location';
    } on PlatformException catch (e) {
      log(e.toString());
      return 'error';
    }
  }
}
