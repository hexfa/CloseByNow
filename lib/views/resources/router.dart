import 'package:get/get.dart';
import 'package:nearby_me/helpers/datials_screen/details_binding.dart';

import '../screens/details/details_screen.dart';
import '../screens/home/home.dart';

class AppRouteName {
  static const String homeScreen = '/home';
  static const String detailsScreen = '/details';

  static List<GetPage> routes = [
    GetPage(
      name: homeScreen,
      page: () => Home(),
    ),
    GetPage(
      name: detailsScreen,
      page: () => const DetailsScreen(),
      binding: DetailsBinding(),
    ),
  ];
}