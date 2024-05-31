import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/presentation/bloc/book/book_list_bloc.dart';
import 'package:books/features/books/presentation/bloc/delete/delete_bloc_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class BookItemWidget extends StatefulWidget {
  final Book book;

  const BookItemWidget({super.key, required this.book});

  @override
  State<BookItemWidget> createState() => _BookItemWidgetState();
}

class _BookItemWidgetState extends State<BookItemWidget> {
  showDialogWidget() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text("Удалить книгу ?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              context
                  .read<DeleteBlocBloc>()
                  .add(DeleteBook(id: widget.book.id));

                context.pop();
            },
            child: Text("Да"),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text("Нет"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocListener<DeleteBlocBloc, DeleteBlocState>(
      listener: (context, state) {
      
        if (state is DeleteBlocSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("успешно удаленно")));
          context.read<BookListBloc>().add(LoadAllBooks());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: theme.cardColor,
          ),
          child: Stack(
            children: [
             widget.book.photo.isNotEmpty ? Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: widget.book.photo,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ) : SizedBox(),
              Positioned.fill(
                  child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                        colors: [Colors.black, Colors.transparent])),
              )),
              Positioned.fill(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.book.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      widget.book.author,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    onTap: () {
                      context.push('/books_list/detail', extra: widget.book);
                    },
                    onLongPress: () {
                      showDialogWidget();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



