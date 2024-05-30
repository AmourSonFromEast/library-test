class Book {
  final String id;
  final String author;
  final String name;
  final String genre;
  final String content;

  Book(
      {required this.id,
      required this.author,
      required this.name,
      required this.genre,
      required this.content});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        author: json['author'],
        content: json['content'],
        genre: json['genre'],
        id: json['id'],
        name: json['name']);
  }
}
