import 'dart:developer';

import 'package:get/get.dart';

class MyController extends GetxController {
  final Rx<String> _searchQuery = Rx<String>('');

  String get searchQuery => _searchQuery.value;

  searchApi(String query) {
    log(query);
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
