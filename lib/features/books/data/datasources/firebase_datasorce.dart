import 'package:books/features/books/data/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatasorce {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Book>?> getAllBooks() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('books').get();

      List<Book> books = querySnapshot.docs.map((doc) {
        return Book.fromFireStore(doc);
      }).toList();

      return books;
    } catch (e) {
      throw Exception("Ошибка получения книг: $e");
    }
  }
}
