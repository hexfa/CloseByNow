import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_me/helpers/home_screen/home_controller.dart';

import 'local_widgets/stores_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put<HomeController>(HomeController());

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10,
              ),
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            const StoresList(),
          ],
        ),
      ),
    );
  }
}
