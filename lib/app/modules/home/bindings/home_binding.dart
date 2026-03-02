import 'package:get/get.dart';
import 'package:news_app/app/data/service/news_service.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Daftarkan NewsService terlebih dahulu
    Get.lazyPut<NewsService>(() => NewsService());
    
    // Kemudian HomeController
    Get.lazyPut<HomeController>(() => HomeController());
  }
}