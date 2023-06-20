import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_me/presentation/unknown/unknown_screen.dart';

import '../presentation/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/home',
          page: () => const Home(),
        ),
      ],
      initialRoute: '/home',
      unknownRoute: GetPage(
        name: '/unknown-screen',
        page: () => const UnknownScreen(),
      ),
      defaultTransition: Transition.circularReveal,
      debugShowCheckedModeBanner: false,
      title: 'NearBy Me',
    );
  }
}
