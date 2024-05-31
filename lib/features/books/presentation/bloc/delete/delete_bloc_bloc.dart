import 'package:bloc/bloc.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_bloc_event.dart';
part 'delete_bloc_state.dart';

class DeleteBlocBloc extends Bloc<DeleteBlocEvent, DeleteBlocState> {
  DeleteBlocBloc(this._repository) : super(DeleteBlocInitial()) {
    on<DeleteBook>((event, emit) async {
      try {
        await _repository.deleteBook(event.id);
        emit(DeleteBlocSuccess());
      } catch (e) {
        emit(DeleteBlocError());
      }
    });
  }
  final BooksRepository _repository;
}
