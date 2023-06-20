import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/widgets/api_error_handling.dart';
import '../../../views/widgets/loading_content.dart';
import '../../../helpers/details_screen/details_controller.dart';
import '../../../models/stores_model.dart';

import 'local_widgets/app_bar_title.dart';
import 'local_widgets/reviews_list.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String storeName = Get.arguments[StoresFields.name];
    final String storePhone = Get.arguments[StoresFields.phone];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: AppBarTitle(
          storeName: storeName,
          storePhone: storePhone,
        ),
      ),
      body: GetBuilder<DetailsController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: LoadingContents(),
            );
          }
          if (controller.errorMessage.isNotEmpty) {
            return ApiErrorHandling(errorMessage: controller.errorMessage);
          } else {
            return ReviewsList(
              storeReviews: controller.storeReviews,
            );
          }
        },
      ),
    );
  }
}
