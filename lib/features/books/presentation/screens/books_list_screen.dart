import 'dart:developer';

import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/presentation/book/book_list_bloc.dart';
import 'package:books/features/books/presentation/widgets/book_item_widget.dart';
import 'package:books/features/books/presentation/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListScreen extends StatefulWidget {
  const BooksListScreen({super.key});

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  void update() {
    context.read<BookListBloc>().add(LoadAllBooks());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<BookListBloc>().add(LoadAllBooks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          update();
        },
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text(
                'Список книг',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              pinned: false,
              floating: true,
              centerTitle: true,
            ),
            BlocBuilder<BookListBloc, BookListState>(
              builder: (context, state) {
                if (state is BookListSuccess) {
                  return SliverList.builder(
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final Book book = state.books[index];

                      return BookItemWidget(
                        book: book
                      );
                    },
                  );
                }

                if (state is BookListInitial) {
                  return const SliverFillRemaining(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "📕",
                        style: TextStyle(fontSize: 70),
                      ),
                      Text("Начни поиск книг!"),
                    ],
                  ));
                }
                if (state is BookListLoading) {
                  return const SliverFillRemaining(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LoadingWidget(), Text("Идет загрузка...")],
                  ));
                }

                if (state is BookListError) {
                  return const SliverFillRemaining(
                      child: Center(
                    child: Text("Ошибка"),
                  ));
                }

                if (state is BookListEmpty) {
                  return const SliverFillRemaining(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "🤔",
                        style: TextStyle(fontSize: 70),
                      ),
                      Text("У нас нету книг ?"),
                    ],
                  ));
                }

                return const SliverFillRemaining(
                  child: Center(
                    child: Text("Что-то явно поломалось"),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.push('/books_list/add_book');
        },
      ),
    );
  }
}
