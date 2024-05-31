import 'dart:io';

import 'package:books/features/books/data/models/book.dart';

abstract interface class BooksRepository {
  Future<List<Book>?> getAllBooks();

  Future<List<Book>?> searchBook(text);

  Future addBook(Book book);

  Future deleteBook(String id);
}
