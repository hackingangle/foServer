class Book {
  final int id;
  final String name;
  final String author;
  final String description;
  final String coverImageUrl;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.description,
    required this.coverImageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['ID'],
      name: json['name'],
      author: json['author'],
      description: json['description'],
      coverImageUrl: json['cover_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'name': name,
      'author': author,
      'description': description,
      'cover_image_url': coverImageUrl,
    };
  }
}