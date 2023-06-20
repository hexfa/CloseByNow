import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_me/helpers/home_controller.dart';

class StoresList extends StatelessWidget {
  const StoresList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.isLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 5,
                ),
                Text('Please Wait...')
              ],
            ),
          );
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.storesList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () => Get.toNamed(
              '/details',
              arguments: controller.storesList[index],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Overall\nRating',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
                Text(controller.storesList[index].rating.toString()),
              ],
            ),
            title: Text(controller.storesList[index].name),
            subtitle: Text(controller.storesList[index].address),
          ),
        );
      },
    );
  }
}
