import 'package:flutter/material.dart';

import '../../../views/extensions/space_xy_extension.dart';

class ErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const ErrorScreen({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.error,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            40,
            16,
            16,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_rounded,
                  color: Theme.of(context).colorScheme.onError,
                  size: 150,
                ),
                12.0.spaceY,
                Text(
                  'Please send this error to developer',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onError,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onError,
                      borderRadius: BorderRadius.circular(12)),
                  child: SelectableText(
                    errorDetails.exception.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
