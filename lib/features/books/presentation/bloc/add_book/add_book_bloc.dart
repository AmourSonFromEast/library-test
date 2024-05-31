import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';
import 'package:equatable/equatable.dart';

part 'add_book_event.dart';
part 'add_book_state.dart';

class AddBookBloc extends Bloc<AddBookEvent, AddBookState> {
  AddBookBloc(this._repository) : super(AddBookInitial()) {
    on<Addbook>((event, emit) async {
      emit(AddBookLoading());
      try {
        await _repository.addBook(event.book,);

        emit(AddBookSuccess());
      } catch (e) {
        emit(AddBookError(error: e));
      }
    });
  }
  final BooksRepository _repository;
}
