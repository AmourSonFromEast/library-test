part of 'book_list_bloc.dart';

sealed class BookListState extends Equatable {
  const BookListState();

  @override
  List<Object> get props => [];
}

final class BookListInitial extends BookListState {}

final class BookListLoading extends BookListState {}

final class BookListEmpty extends BookListState {}

final class BookListError extends BookListState {
  final Object error;

  BookListError({required this.error});
  @override
  List<Object> get props => [error];
}

final class BookListSuccess extends BookListState {
  final List<Book> books;

  BookListSuccess({required this.books});
  @override
  List<Object> get props => [books];
}
