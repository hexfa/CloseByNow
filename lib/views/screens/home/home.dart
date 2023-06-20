import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_me/helpers/home_screen/home_controller.dart';

import 'local_widgets/stores_list.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HomeController homeController = Get.put<HomeController>(HomeController());

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NearBy App'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 10,
            ),
            child: TextFormField(
              controller: _searchController,
              autofocus: true,
              onChanged: homeController.updateQuery,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                label: Text('Search your location'),
                hintText: 'Exp: London, Amsterdam, ...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const StoresList(),
        ],
      ),
    );
  }
}
