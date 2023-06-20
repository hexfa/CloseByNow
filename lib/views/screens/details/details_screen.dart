import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/stores_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoresModel storeDetails = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(storeDetails.name),
      ),
      body: Column(
        children: [
          Text('Phone number is ${storeDetails.phone}'),
          const Text('Reviews:'),
          const Text('storeDetails.reviews'),
        ],
      ),
    );
  }
}
