import 'package:get/get.dart';
import 'package:news_app/app/data/model/news_model.dart';
import 'package:news_app/app/data/service/news_service.dart';

class HomeController extends GetxController {
  final NewsService newsService = Get.find();

  var newsList = <Article>[].obs;
  var isLoading = true.obs;

  

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getNewsIDN();
  }

void getNewsIDN() async {
  try {
    isLoading(true);
    final response = await newsService.getNewsIDN("indonesia");
    
    // Log untuk melihat status dan body (sangat membantu saat debug)
    print("Status Code: ${response.statusCode}");
    
    if (response.statusCode == 200) {
      final newsData = NewsResponse.fromJson(response.body);
      newsList.assignAll(newsData.articles);
    } else {
      // Jika error, ini akan menampilkan alasan dari API (misal: "apiKeyInvalid")
      print("Error loading news: ${response.body}");
    }
  } catch (e) {
    print("Exception: $e");
  } finally {
    isLoading(false);
  }
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
