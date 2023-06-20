import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../../helpers/home_screen/home_controller.dart';
import '../../../views/screens/home/local_widgets/stores_list.dart';
import '../../widgets/loading_content.dart';
import 'local_widgets/not_found_any_result.dart';
import 'local_widgets/search_result_title.dart';
import 'local_widgets/waiting_for_search.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
                  IconButton(
                    onPressed: () async {
                      final String location = await getLocation();
                      _searchController.text = '';
                      _searchController.text = location;
                      await homeController.searchApi(location);
                    },
                    icon: const Icon(Icons.location_pin),
                    style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                ],
              ),
            ),
            GetBuilder<HomeController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return const LoadingContents();
                }
                return controller.storesList.isEmpty
                    ? controller.searchQuery.isEmpty
                        ? const WaitingForSearch()
                        : const NotFoundAnyResult()
                    : Column(
                        children: [
                          SearchResultTitle(
                            cityName: controller.searchQuery,
                          ),
                          StoresList(
                            storesList: controller.storesList,
                          ),
                        ],
                      );
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
          throw 'Location permission denied';
        case LocationPermission.deniedForever:
          throw 'Location permission denied forever';
        case LocationPermission.always:
          return permissionAccepted();
        case LocationPermission.whileInUse:
          return permissionAccepted();

        default:
          'Location permission';
      }

      return 'Can\'t access to your local';
    } on PlatformException catch (e) {
      log(e.toString());
      return 'error';
    }
  }
}
