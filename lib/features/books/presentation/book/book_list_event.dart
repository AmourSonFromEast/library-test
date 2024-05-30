part of 'book_list_bloc.dart';

sealed class BookListEvent extends Equatable {
  const BookListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllBooks extends BookListEvent {}

class DeleteBook extends BookListEvent {
  final String id;

  DeleteBook({required this.id});
  @override
  List<Object> get props => [id];
}

class AddBook extends BookListEvent {
  final Book book;

  AddBook({required this.book});
  @override
  List<Object> get props => [book];
}
