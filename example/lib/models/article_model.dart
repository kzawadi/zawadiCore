import 'dart:convert';

class Article {
  String? id;
  String? name;
  String? author;
  String? title;
  String? content;
  String? urlToImage;
  String? publishedAt;

  Article({
    this.id,
    this.name,
    this.author,
    this.title,
    this.content,
    this.urlToImage,
    this.publishedAt,
  });

  Article copyWith({
    String? id,
    String? name,
    String? author,
    String? title,
    String? content,
    String? urlToImage,
    String? publishedAt,
  }) {
    return Article(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      title: title ?? this.title,
      content: content ?? this.content,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'title': title,
      'content': content,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }

  String get getImageUrl => '$urlToImage';

  String get getPublishedAtFormattedTime {
    return (DateTime.now().difference(DateTime.parse(publishedAt!)).inHours < 1)
        ? DateTime.now()
                .difference(DateTime.parse(publishedAt!))
                .inMinutes
                .toString() +
            'm ago'
        : DateTime.now()
                .difference(DateTime.parse(publishedAt!))
                .inHours
                .toString() +
            'h ago';
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['source']['id'],
      name: map['source']['name'],
      author: map['author'],
      title: map['title'],
      content: map['content'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article(id: $id, name: $name, author: $author, title: $title, content: $content, urlToImage: $urlToImage, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.id == id &&
        other.name == name &&
        other.author == author &&
        other.title == title &&
        other.content == content &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        author.hashCode ^
        title.hashCode ^
        content.hashCode ^
        urlToImage.hashCode ^
        publishedAt.hashCode;
  }
}
