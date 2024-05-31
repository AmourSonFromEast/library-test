part of 'delete_bloc_bloc.dart';

sealed class DeleteBlocState extends Equatable {
  const DeleteBlocState();
  
  @override
  List<Object> get props => [];
}

final class DeleteBlocInitial extends DeleteBlocState {}

final class DeleteBlocLoading extends DeleteBlocState {}
final class DeleteBlocSuccess extends DeleteBlocState {}
final class DeleteBlocError extends DeleteBlocState {}
