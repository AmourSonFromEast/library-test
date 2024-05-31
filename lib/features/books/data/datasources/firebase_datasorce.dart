import 'package:books/features/books/data/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uuid/uuid.dart';

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

  Future deleteBook(String id) async {
    try {
      await _firestore.collection('books').doc(id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Book>?> searchBook(String text) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot;

      // Поиск по "name"
      querySnapshot = await _firestore
          .collection('books')
          .where('name', isGreaterThanOrEqualTo: text)
          .where('name', isLessThanOrEqualTo: text + '\uf8ff')
          .get();

      List<Book> foundBooks = querySnapshot.docs.map((doc) {
        return Book.fromFireStore(doc);
      }).toList();

      // Если ничего не найдено по "name", выполнить поиск по "author"
      if (foundBooks.isEmpty) {
        querySnapshot = await _firestore
            .collection('books')
            .where('author', isGreaterThanOrEqualTo: text)
            .where('author', isLessThanOrEqualTo: text + '\uf8ff')
            .get();

        foundBooks = querySnapshot.docs.map((doc) {
          return Book.fromFireStore(doc);
        }).toList();
      }

      return foundBooks;
    } catch (e) {
      throw Exception("Ошибка получения книг: $e");
    }
  }

  Future addBook(Book book) async {
    try {
      var uuid = Uuid().v4();
      Map<String, dynamic> data = {
        'id': uuid.toString(),
        "author": book.author,
        "name": book.name,
        "content": book.content,
        "genre": book.genre,
        "photo": book.photo
      };

      await _firestore.collection('books').doc(uuid).set(data);
    } catch (e) {}
  }
}
