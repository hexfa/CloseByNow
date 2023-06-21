import 'package:flutter/material.dart';

import '../../../../views/extensions/space_xy_extension.dart';
import '../../../resources/assets.dart';

class NotFoundAnyResult extends StatelessWidget {
  const NotFoundAnyResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        20.0.spaceY,
        Text(
          'This location has no stores\nNOTICE: Location character must be at least 4 digits!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        Container(
          width: screenWidth,
          height: screenWidth,
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManagement.notFoundResult))),
        ),
      ],
    );
  }
}
