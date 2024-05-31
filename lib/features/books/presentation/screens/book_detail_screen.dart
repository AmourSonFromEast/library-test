import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/presentation/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            title: Text(book.name),
         ),
       book.photo.isNotEmpty ?   SliverFillRemaining(child: CachedNetworkImage(
                imageUrl:  book.photo,
                fit: BoxFit.cover,
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ), ) : SliverToBoxAdapter(),

         SliverToBoxAdapter(
              child: SizedBox(
                height: 55, // Установите желаемую высоту
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: book.genre.length,
                  itemBuilder: (context, index) {
                    return Container(
                 
                      color: Colors.green,
                      margin: EdgeInsets.all(8),
                      child: Center(
                        child: Text(book.genre[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          SliverList.list(children: [Text(book.content)])
        ],
      ),
    );
  }
}
