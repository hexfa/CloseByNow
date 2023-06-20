import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Unknown page'),
        ElevatedButton.icon(
          onPressed: () => Get.offAllNamed('/home'),
          icon: const Icon(Icons.home),
          label: const Text('Home Page'),
        ),
      ],
    );
  }
}
