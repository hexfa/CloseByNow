import 'package:flutter/material.dart';

import 'views/app/my_app.dart';
import 'views/screens/error/error_screen.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
      ErrorScreen(errorDetails: errorDetails);
  runApp(const MyApp());
}
