import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_me/views/resources/assets.dart';
import '../../../extensions/space_xy_extension.dart';
import 'package:nearby_me/helpers/home_screen/home_controller.dart';
import 'package:nearby_me/models/stores_model.dart';
import 'package:nearby_me/views/resources/router.dart';

class StoresList extends StatelessWidget {
  const StoresList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.isLoading) {
          return SizedBox(
            height: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                5.0.spaceY,
                const Text('Please Wait...')
              ],
            ),
          );
        }
        return controller.storesList.isEmpty
            ? Container(
                width: screenWidth,
                height: screenWidth,
                padding: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetsManagement.searchAround))),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.storesList.length,
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
                          StoresFields.id: controller.storesList[index].id,
                          StoresFields.name: controller.storesList[index].name,
                          StoresFields.phone:
                              controller.storesList[index].phone,
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
                            controller.storesList[index].rating.toString(),
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
                        controller.storesList[index].name,
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      subtitle: Text(
                        controller.storesList[index].address,
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
      },
    );
  }
}
