import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../models/stores_model.dart';
import '../../../../views/resources/router.dart';

class StoresList extends StatefulWidget {
  final List<StoresModel> storesList;
  const StoresList({
    required this.storesList,
    Key? key,
  }) : super(key: key);

  @override
  State<StoresList> createState() => _StoresListState();
}

class _StoresListState extends State<StoresList> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.storesList.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(microseconds: 80),
          child: SlideAnimation(
            duration: const Duration(microseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 30,
            verticalOffset: 300.0,
            child: FlipAnimation(
              duration: const Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
              flipAxis: FlipAxis.x,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 6.0,
                  left: 6.0,
                ),
                child: Card(
                  elevation: 2,
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    onTap: () => Get.toNamed(
                      AppRouteName.detailsScreen,
                      arguments: {
                        StoresFields.id: widget.storesList[index].id,
                        StoresFields.name: widget.storesList[index].name,
                        StoresFields.phone: widget.storesList[index].phone,
                      },
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Overall\nRating',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          widget.storesList[index].rating.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      widget.storesList[index].name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    subtitle: Text(
                      widget.storesList[index].address,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(.5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
