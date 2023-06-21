import 'package:flutter/material.dart';

import '../resources/assets.dart';

class ApiErrorHandling extends StatelessWidget {
  final String errorMessage;
  const ApiErrorHandling({
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: screenWidth,
          margin: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 10,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error.withOpacity(.7),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            'Server ERROR: $errorMessage\nPlease send this message to developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        Container(
          width: screenWidth,
          height: screenWidth,
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManagement.apiError))),
        ),
      ],
    );
  }
}
