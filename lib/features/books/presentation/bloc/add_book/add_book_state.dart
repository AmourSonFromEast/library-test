part of 'add_book_bloc.dart';

sealed class AddBookState extends Equatable {
  const AddBookState();
  
  @override
  List<Object> get props => [];
}

final class AddBookInitial extends AddBookState {}
final class AddBookSuccess extends AddBookState {}
final class AddBookLoading extends AddBookState {}
final class AddBookError extends AddBookState {
final Object error;

  AddBookError({required this.error});
    @override
  List<Object> get props => [error];
}


