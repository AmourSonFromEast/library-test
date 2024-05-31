part of 'add_book_bloc.dart';

sealed class AddBookEvent extends Equatable {
  const AddBookEvent();

  @override
  List<Object> get props => [];
}


class Addbook extends AddBookEvent {
  final Book book;


  Addbook({required this.book});

    @override
  List<Object> get props => [book];
}