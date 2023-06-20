import 'package:flutter/material.dart';

import '../presentation/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NearBy Me',
      home: Home(title: 'NearBy Me'),
    );
  }
}
