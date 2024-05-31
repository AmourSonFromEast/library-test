import 'dart:io';

import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/presentation/bloc/add_book/add_book_bloc.dart';
import 'package:books/features/books/presentation/bloc/book/book_list_bloc.dart';
import 'package:books/features/books/presentation/widgets/loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddBookSreen extends StatefulWidget {
  const AddBookSreen({super.key});

  @override
  State<AddBookSreen> createState() => _AddBookSreenState();
}

class _AddBookSreenState extends State<AddBookSreen> {
  File? _imgFile;
  bool isgenreValidate = false;

  bool isLoading = false;
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _contentController = TextEditingController();
  final _imageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, bool> _categories = {
    'Мелодрама': false,
    'Комедия': false,
    'Боевик': false,
    'Роман': false,
    'мистерия': false,
    'Другое': false,
  };

  void addBook() {
    if (_formKey.currentState!.validate() == true) {
      List<String> trueCategories = [];

      _categories.forEach((key, value) {
        if (value) {
          trueCategories.add(key);
          setState(() {
            isgenreValidate = true;
          });
        }
      });

      Book book = Book(
          author: _authorController.text.trim(),
          content: _contentController.text.trim(),
          genre: trueCategories,
          id: '',
          name: _nameController.text.trim(),
          photo: _imageController.text.trim());

      context.read<AddBookBloc>().add(Addbook(book: book));
    }
  }

  String? validateFormField(value) {
    if (value!.isEmpty || value == null) {
      return 'Обязательный параметр';
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<AddBookBloc, AddBookState>(
      listener: (context, state) {
        if (state is AddBookSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Книга успешно добавлена")));
          setState(() {
            isLoading = false;
          });
          
        }
        if (state is AddBookLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is AddBookInitial) {
          setState(() {
            isLoading = false;
          });
        }
        if (state is AddBookError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Ошибка: ${state.error}")));
          setState(() {
            isLoading = false;
          });
          
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text("Добавить свою книгу"),
              actions: [IconButton(onPressed: addBook, icon: Icon(Icons.add))],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _imageController,
                   
                      decoration: InputDecoration(
                          hintText: 'Ссылка на картинку (если имеется)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                   
                    TextFormField(
                      controller: _nameController,
                      validator: (value) => validateFormField(value),
                      decoration: InputDecoration(
                          hintText: 'Название книги',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    TextFormField(
                      controller: _authorController,
                      validator: (value) => validateFormField(value),
                      decoration: InputDecoration(
                        hintText: 'Имя автора',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          String category = _categories.keys.elementAt(index);
                          bool isChecked = _categories.values.elementAt(index);

                          return CheckboxListTile(
                            title: Text(category),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                _categories[category] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    isgenreValidate
                        ? SizedBox()
                        : Text("Необходимо указать хотябы 1 жанр"),
                    TextFormField(
                      controller: _contentController,
                      validator: (value) => validateFormField(value),
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Описание книги',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          isLoading
              ? Positioned.fill(
                  child: Center(
                  child: Container(
                      color: Theme.of(context)
                          .colorScheme
                          .surface
                          .withOpacity(0.50),
                      child: LoadingWidget()),
                ))
              : SizedBox()
        ],
      ),
    );
  }
}
