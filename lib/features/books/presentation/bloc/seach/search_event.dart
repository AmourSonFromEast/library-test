part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}
class Search extends SearchEvent {
  final String text;

  Search({required this.text});
    @override
  List<Object> get props => [text];

}