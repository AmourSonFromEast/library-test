import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddBookSreen extends StatefulWidget {
  const AddBookSreen({super.key});

  @override
  State<AddBookSreen> createState() => _AddBookSreenState();
}

class _AddBookSreenState extends State<AddBookSreen> {
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавить свою книгу"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: 'Название книги',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            )
          ],
        ),
      ),
    );
  }
}
