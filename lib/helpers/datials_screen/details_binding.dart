import 'package:get/get.dart';
import 'package:nearby_me/helpers/datials_screen/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailsController>(DetailsController());
  }
}
