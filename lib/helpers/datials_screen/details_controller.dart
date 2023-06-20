import 'package:get/get.dart';
import 'package:nearby_me/core/data_state.dart';
import 'package:nearby_me/models/stores_model.dart';

import '../../models/store_reviews_model.dart';
import '../../services/remote/api_services.dart';

class DetailsController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  bool isLoading = false;
  List<StoreReviewsModel> storeReviews = [];

  _getStoreReviews(String storeId) async {
    isLoading = true;
    update();

    await _apiServices.getStoreReviews(storeId).then((DataState dataState) {
      if (dataState is SuccessfulDataState) {
        storeReviews = dataState.data;
        isLoading = false;
        update();
      }
      if (dataState is FailureDataState) {
        storeReviews = [];
        isLoading = false;
        update();
      }
    });
  }

  @override
  void onInit() {
    _getStoreReviews(Get.arguments[StoresFields.id]);
    super.onInit();
  }
}
