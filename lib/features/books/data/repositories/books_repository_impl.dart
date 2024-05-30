import 'package:books/features/books/data/datasources/firebase_datasorce.dart';
import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final FirebaseDatasorce _firebaseDatasorce;

  BooksRepositoryImpl({required FirebaseDatasorce firebaseDatasorce})
      : _firebaseDatasorce = firebaseDatasorce;

  @override
  Future addBook(Book book) {
    // TODO: implement addBook
    throw UnimplementedError();
  }

  @override
  Future deleteBook(String id) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>?> getAllBooks() async {
    try {
      List<Book>? books = await _firebaseDatasorce.getAllBooks();

      if (books != null) {
        return books;
      } else {
        // TODO: implement deleteBook
        throw UnimplementedError();
      }
    } catch (e) {
      throw Exception('Ошибка получения книг: $e');
    }
  }

  @override
  Future<List<Book>?> searchBook() {
    // TODO: implement searchBook
    throw UnimplementedError();
  }
}
