import 'package:books/features/books/data/datasources/firebase_datasorce.dart';
import 'package:books/features/books/data/repositories/books_repository_impl.dart';
import 'package:books/features/books/domain/repositories/books_repository.dart';
import 'package:books/features/books/presentation/book/book_list_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> initDi(bool isTest) async {
  if (isTest) {
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
  
}
