import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/stores_model.dart';
import '../../../../views/resources/router.dart';

class StoresList extends StatelessWidget {
  final List<StoresModel> storesList;
  const StoresList({
    required this.storesList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: storesList.length,
      itemBuilder: (context, index) => Padding(
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
                StoresFields.id: storesList[index].id,
                StoresFields.name: storesList[index].name,
                StoresFields.phone: storesList[index].phone,
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
                  storesList[index].rating.toString(),
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
              storesList[index].name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            subtitle: Text(
              storesList[index].address,
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
    );
  }
}
