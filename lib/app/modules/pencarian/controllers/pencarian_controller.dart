import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/model/news_model.dart';
import 'package:news_app/app/data/service/news_service.dart';

class PencarianController extends GetxController {
  final newsService = Get.find<NewsService>();
  final searchController = TextEditingController();

  final isLoading = false.obs;
  final articles = <Article>[].obs;
  final searchMessage = ''.obs;
  final selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    searchByCategory('All');
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> searchNews(String query) async {
    if (query.isEmpty) return;

    isLoading.value = true;
    searchMessage.value = '';
    articles.clear();
    selectedCategory.value = 'All';

    try {
      final response = await newsService.getNewsIDN(query);
      _handleResponse(response, query: query);
    } catch (e) {
      searchMessage.value = "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchByCategory(String category) async {
    isLoading.value = true;
    searchMessage.value = '';
    articles.clear();
    selectedCategory.value = category;
    searchController.clear();

    String apiCategory = category.toLowerCase();
    if (category == 'Tech') apiCategory = 'technology';
    if (category == 'Politics') apiCategory = 'general';
    if (category == 'All') apiCategory = 'general'; // Changed from 'All'

    print('🔍 Searching category: $category (API: $apiCategory)');

    try {
      final response = await newsService.getNewsByCategory(apiCategory);
      print('📡 Response status: ${response.statusCode}');

      // If top-headlines fails, fallback to everything endpoint
      if (response.statusCode != 200 || response.body == null) {
        print('⚠️ Top-headlines failed, trying everything endpoint...');
        final fallbackResponse = await newsService.getNewsIDN(category);
        print('📡 Fallback response status: ${fallbackResponse.statusCode}');
        _handleResponse(fallbackResponse, category: category);
      } else {
        print('📡 Response body: ${response.body}');
        _handleResponse(response, category: category);
      }
    } catch (e) {
      print('❌ Error: $e');
      // Try fallback on error
      try {
        print('⚠️ Trying fallback to everything endpoint...');
        final fallbackResponse = await newsService.getNewsIDN(category);
        _handleResponse(fallbackResponse, category: category);
      } catch (fallbackError) {
        print('❌ Fallback also failed: $fallbackError');
        searchMessage.value = "An error occurred: $fallbackError";
      }
    } finally {
      isLoading.value = false;
    }
  }

  void _handleResponse(Response response, {String? query, String? category}) {
    print('🔄 Handling response...');
    if (response.status.hasError) {
      print('❌ Response has error: ${response.statusText}');
      searchMessage.value = "Failed to load news: ${response.statusText}";
    } else {
      try {
        final newsResponse = NewsResponse.fromJson(response.body);
        print('✅ Articles found: ${newsResponse.articles.length}');
        if (newsResponse.articles.isEmpty) {
          if (query != null) {
            searchMessage.value = "No articles found for '$query'";
          } else {
            searchMessage.value = "No articles found in '$category'";
          }
        } else {
          articles.assignAll(newsResponse.articles);
        }
      } catch (e) {
        print('❌ Error parsing response: $e');
        searchMessage.value = "Error parsing news data: $e";
      }
    }
  }
}
