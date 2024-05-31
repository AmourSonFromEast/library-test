part of 'delete_bloc_bloc.dart';

sealed class DeleteBlocEvent extends Equatable {
  const DeleteBlocEvent();

  @override
  List<Object> get props => [];
}


class DeleteBook  extends DeleteBlocEvent {
  final String id;

  DeleteBook({required this.id});
  
  @override
  List<Object> get props => [id];

}