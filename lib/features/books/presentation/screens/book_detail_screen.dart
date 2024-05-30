import 'package:books/features/books/presentation/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookDetailScreen extends StatelessWidget {
  final String id;
  const BookDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            title: Text("НАЗВАНИЕ КНИГИ"),
         ),
          SliverFillRemaining(child: CachedNetworkImage(
                imageUrl:  "https://b1.multvkino.tlum.ru/c/43.340x340.jpg",
                fit: BoxFit.cover,
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ), ),
          SliverList.builder(itemBuilder: (context, index) => ListTile(title: Text("rewrwe"),),)
        ],
      ),
    );
  }
}
