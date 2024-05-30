import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  
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
  Future<List<Book>?> getAllBooks() async{


    
    
  }

  @override
  Future<List<Book>?> searchBook() {
    // TODO: implement searchBook
    throw UnimplementedError();
  }
  
}