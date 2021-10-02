import 'dart:convert';

class Source {
  String? id;
  String? name;
  String? category;
  String? country;

  Source({
    this.id,
    this.name,
    this.category,
    this.country,
  });

  Source copyWith({
    String? id,
    String? name,
    String? category,
    String? country,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'country': country,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Source(id: $id, name: $name, category: $category, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Source &&
        other.id == id &&
        other.name == name &&
        other.category == category &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ category.hashCode ^ country.hashCode;
  }
}
