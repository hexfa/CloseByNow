import 'package:flutter/material.dart';

import '../../../resources/assets.dart';

class WaitingForSearch extends StatelessWidget {
  const WaitingForSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenWidth,
      padding: const EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManagement.searchAround))),
    );
  }
}
