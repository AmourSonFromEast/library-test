import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String id;
  final String author;
  final String name;
  final String genre;
  final String content;
  final String photo;

  Book(
      {required this.id,
      required this.author,
      required this.name,
      required this.genre,
      required this.content,
      required this.photo});

  factory Book.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final doc = snapshot.data();
    return Book(
        author: doc?['author'] ?? '',
        content: doc?['content'] ?? '',
        genre: doc?['genre'] ?? '',
        id: doc?['id'] ?? '',
        photo: doc?['photo'] ?? '',
        name: doc?['name'] ?? '');
  }
}
