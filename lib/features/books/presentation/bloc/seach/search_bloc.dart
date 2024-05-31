import 'package:bloc/bloc.dart';
import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._repository) : super(SearchInitial()) {
    on<Search>((event, emit) async {
      emit(SearchLoading());
      try {
        List<Book>? books = await _repository.searchBook(event.text);

        if (books == null || books.length == 0) {
          emit(SearchEmpty());
        } else {
          emit(SearchSuccess(books: books));
        }
      } catch (e) {
        emit(SearchError());
      }
    });
  }
  final BooksRepository _repository;
}
