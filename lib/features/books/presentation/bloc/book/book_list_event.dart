part of 'book_list_bloc.dart';

sealed class BookListEvent extends Equatable {
  const BookListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllBooks extends BookListEvent {}


