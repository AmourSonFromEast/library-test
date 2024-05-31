import 'package:books/app.dart';
import 'package:books/di.dart';
import 'package:books/features/books/presentation/bloc/add_book/add_book_bloc.dart';
import 'package:books/features/books/presentation/bloc/book/book_list_bloc.dart';
import 'package:books/features/books/presentation/bloc/delete/delete_bloc_bloc.dart';
import 'package:books/features/books/presentation/bloc/seach/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDi(false);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl.get<BookListBloc>(),
      ),
      BlocProvider(
        create: (context) => sl.get<AddBookBloc>(),
      ),
      BlocProvider(
        create: (context) => sl.get<DeleteBlocBloc>(),
      ),
        BlocProvider(
        create: (context) => sl.get<SearchBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}
