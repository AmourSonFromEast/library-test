import 'package:bloc/bloc.dart';
import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';
import 'package:equatable/equatable.dart';

part 'book_list_event.dart';
part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  BookListBloc(this._repository) : super(BookListInitial()) {
    on<BookListEvent>((event, emit) async {
      emit(BookListLoading());

      try {
        List<Book>? books = await _repository.getAllBooks();

        if (books == null || books!.length == 0) {
          emit(BookListEmpty());
        } else {
          emit(BookListSuccess(books: books));
        }
      } catch (e) {
        emit(BookListError(error: e));
      }
    });
  }
  final BooksRepository _repository;
}
