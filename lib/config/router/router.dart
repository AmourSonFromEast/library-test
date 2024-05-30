import 'package:books/features/books/presentation/screens/books_list_screen.dart';
import 'package:go_router/go_router.dart';




final router = GoRouter(
  initialLocation: '/books_list',
  routes: [
  
  GoRoute(path: '/books_list', builder: (context, state) => BooksListScreen(),)

]);
