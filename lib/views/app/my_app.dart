import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_me/views/resources/router.dart';
import 'package:nearby_me/views/resources/theme.dart';
import 'package:nearby_me/views/screens/unknown/unknown_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRouteName.routes,
      initialRoute: AppRouteName.homeScreen,
      unknownRoute: GetPage(
        name: '/unknown-screen',
        page: () => const UnknownScreen(),
      ),
      defaultTransition: Transition.circularReveal,
      debugShowCheckedModeBanner: false,
      title: 'NearBy Me',
      theme: getApplicationTheme(),
    );
  }
}
