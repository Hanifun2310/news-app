class NewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    status: json['status'] ?? "",
    totalResults: json['totalResults'] ?? 0,
    articles: List<Article>.from(
      (json['articles'] ?? []).map((x) => Article.fromJson(x)),
    ),
  );
}

class Article {
  final Source source;
  final String title;
  final String description;
  final String author;
  final String imageUrl;
  final String Url;

  Article({
    required this.source,
    required this.title,
    required this.description,
    required this.author,
    required this.imageUrl,
    required this.Url,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json['source'] ?? {}),
    title: json['title'] ?? "",
    description: json['description'] ?? "",
    author: json['author'] ?? "",
    imageUrl: json['urlToImage'] ?? "",
    Url: json['url'] ?? "",
  );
}

class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json['id'] ?? "", name: json['name'] ?? "");
}
