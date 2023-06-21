import 'package:flutter/material.dart';

import '../../../../views/extensions/space_xy_extension.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.storeName,
    required this.storePhone,
  }) : super(key: key);

  final String storeName;
  final String storePhone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storeName,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              child: Icon(
                Icons.phone_in_talk,
                color: Theme.of(context).colorScheme.surface,
                size: 8,
              ),
            ),
            3.0.spaceX,
            Text(
              storePhone,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
