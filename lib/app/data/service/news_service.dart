import 'package:news_app/app/data/constant.dart';
import 'package:get/get.dart';

class NewsService extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['User-Agent'] = 'news_app';
      return request;
    });
    super.onInit();
  }

  Future<Response> getNewsByCategory(String category) => get(
    '${Endpoints.baseUrl}/top-headlines',
    query: {
      'country': 'id',
      if (category != 'All') 'category': category,
      'apiKey': Endpoints.apiKey,
    },
  );

  Future<Response> getNewsIDN(String query) => get(
    '${Endpoints.baseUrl}/everything',
    query: {'q': query, "sortBy": "publishedAt", 'apiKey': Endpoints.apiKey},
  );
}
