import 'dart:io';

import 'package:books/features/books/data/datasources/firebase_datasorce.dart';
import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final FirebaseDatasorce _firebaseDatasorce;

  BooksRepositoryImpl({required FirebaseDatasorce firebaseDatasorce})
      : _firebaseDatasorce = firebaseDatasorce;

  @override
  Future addBook(Book book) async {
    try {
      await _firebaseDatasorce.addBook(book);

    } catch (e) {
      throw Exception("Ошибка добавления книги");
    }
  }

  @override
  Future deleteBook(String id) async {

    try {
      await _firebaseDatasorce.deleteBook(id);
      
    } catch (e) {
      throw Exception(e);
      
    }

   
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
  Future<List<Book>?> searchBook(text) async {

    try {
      return _firebaseDatasorce.searchBook(text);
      
    } catch (e) {
      
    }

  
  }
}
