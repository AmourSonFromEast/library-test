part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchEmpty extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<Book>? books;

  SearchSuccess({required this.books});
    @override
  List<Object> get props => books!;
}
final class SearchError extends SearchState {}
