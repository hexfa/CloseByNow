import 'package:get/get.dart';
import 'package:nearby_me/core/data_state.dart';
import 'package:nearby_me/models/stores_model.dart';
import 'package:nearby_me/services/remote/api_services.dart';

class HomeController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  final Rx<String> _searchQuery = Rx<String>('');
  String get searchQuery => _searchQuery.value;

  bool isLoading = false;
  List<StoresModel> storesList = [];

  _fetchStoresList(String location) async {
    isLoading = true;
    update();
    await _apiServices.getStoresList(location).then((DataState dataState) {
      if (dataState is SuccessfulDataState) {
        storesList = dataState.data;
        isLoading = false;
        update();
      }
      if (dataState is FailureDataState) {
        storesList = [];
        isLoading = false;
        update();
      }
    });
  }

  searchApi(String query) {
    _fetchStoresList(query);
  }

  updateQuery(String query) {
    _searchQuery.value = query;
  }

  @override
  void onInit() {
    debounce(
      _searchQuery,
      searchApi,
      time: const Duration(seconds: 2),
    );
    super.onInit();
  }
}
