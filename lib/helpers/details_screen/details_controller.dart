import 'package:get/get.dart';

import '../../core/data_state.dart';
import '../../models/stores_model.dart';
import '../../models/store_reviews_model.dart';
import '../../services/remote/api_services.dart';

class DetailsController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  bool isLoading = false;
  List<StoreReviewsModel> storeReviews = [];
  String errorMessage = '';

  _getStoreReviews(String storeId) async {
    isLoading = true;
    update();
    DataState<List<StoreReviewsModel>> dataState =
        await _apiServices.getStoreReviews(storeId);
    if (dataState is SuccessfulDataState) {
      isLoading = false;
      storeReviews = dataState.data!;
      errorMessage = '';
      update();
    }
    if (dataState is FailureDataState) {
      storeReviews = [];
      errorMessage = dataState.error!;
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    _getStoreReviews(Get.arguments[StoresFields.id]);
    super.onInit();
  }
}
