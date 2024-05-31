import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/presentation/bloc/seach/search_bloc.dart';
import 'package:books/features/books/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchBooksScreen extends StatefulWidget {
  const SearchBooksScreen({super.key});

  @override
  State<SearchBooksScreen> createState() => _SearchBooksScreenState();
}

class _SearchBooksScreenState extends State<SearchBooksScreen> {
  final _searchController = TextEditingController();

  void search() {
    context.read<SearchBloc>().add(Search(text: _searchController.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск книги'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) {
              search();
            },
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.books!.length,
                    itemBuilder: (context, index) {
                      Book book = state.books![index];
                      return ListTile(
                        onTap: () {
                          context.go('/books_list/detail', extra: book);
                        },
                        title: Text(book.name),
                        subtitle: Text(book.author),
                      );
                    },
                  ),
                );
              }
              if(state is SearchLoading) {
                return Center(child: LoadingWidget(),);
              }
              if(state is SearchInitial) {
                return Center(child: Text("Начни поиск "),);
              }

              if(state is SearchEmpty) {
                  return Center(child:  Text("Пусто"));
              }
              return Center(child:  Text("ОШИБКА"));
            },
          )
        ],
      ),
    );
  }
}
