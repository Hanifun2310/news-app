import 'package:get/get.dart';
import 'package:news_app/app/data/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailController extends GetxController {
  final article = Rx<Article?>(null);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Article) {
      article.value = Get.arguments as Article;
    }
  }

  Future<void> openArticleUrl() async {
    final url = article.value?.Url;
    if (url == null || url.isEmpty) {
      Get.snackbar(
        "Error",
        "Article URL not available",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to open article: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
