import 'package:books/features/books/data/datasources/firebase_datasorce.dart';
import 'package:books/features/books/data/repositories/books_repository_impl.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';
import 'package:books/features/books/presentation/bloc/add_book/add_book_bloc.dart';
import 'package:books/features/books/presentation/bloc/book/book_list_bloc.dart';
import 'package:books/features/books/presentation/bloc/delete/delete_bloc_bloc.dart';
import 'package:books/features/books/presentation/bloc/seach/search_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> initDi(bool isTest) async {
  if (isTest) {
    throw UnimplementedError();
  } else {
    releaseDi();
  }
}

void releaseDi() {
  // DATA SOURCE
  sl.registerSingleton(FirebaseDatasorce());

  // REPOSITORY
  sl.registerSingleton<BooksRepository>(
      BooksRepositoryImpl(firebaseDatasorce: sl()));

  // BLOC

  sl.registerSingleton(BookListBloc(sl()));
  sl.registerSingleton(AddBookBloc(sl()));
  sl.registerSingleton(DeleteBlocBloc(sl()));
  sl.registerSingleton(SearchBloc(sl()));
  
}
