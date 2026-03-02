import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final tabindex = 0.obs;

  void changeTabIndex(int index) {
    tabindex.value = index;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
