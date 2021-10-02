import 'dart:convert';

class Source {
  String? id;
  String? name;
  String? category;
  String? country;
  String? description;
  String? url;
  String? language;
  Source({
    this.id,
    this.name,
    this.category,
    this.country,
    this.description,
    this.url,
    this.language,
  });

  Source copyWith({
    String? id,
    String? name,
    String? category,
    String? country,
    String? description,
    String? url,
    String? language,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      country: country ?? this.country,
      description: description ?? this.description,
      url: url ?? this.url,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'country': country,
      'description': description,
      'url': url,
      'language': language,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      country: map['country'],
      description: map['description'],
      url: map['url'],
      language: map['language'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Source(id: $id, name: $name, category: $category, country: $country, description: $description, url: $url, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Source &&
        other.id == id &&
        other.name == name &&
        other.category == category &&
        other.country == country &&
        other.description == description &&
        other.url == url &&
        other.language == language;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        category.hashCode ^
        country.hashCode ^
        description.hashCode ^
        url.hashCode ^
        language.hashCode;
  }
}
