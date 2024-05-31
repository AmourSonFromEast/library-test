import 'package:books/features/books/data/models/book.dart';
import 'package:books/features/books/presentation/screens/add_book_screen.dart';
import 'package:books/features/books/presentation/screens/books_list_screen.dart';
import 'package:books/features/books/presentation/screens/book_detail_screen.dart';
import 'package:books/features/books/presentation/screens/main_screen.dart';
import 'package:books/features/books/presentation/screens/search_books_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

 GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final router = GoRouter(
    initialLocation: '/books_list',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
     
        pageBuilder: (context, state, navigationShell) =>
            buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: MainScreen(navigationShell: navigationShell)),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/books_list',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: BooksListScreen()),
                  routes: [
                    GoRoute(
                      path: 'add_book',
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          buildPageWithDefaultTransition(
                              context: context,
                              state: state,
                              child: AddBookSreen()),
                    ),
                    GoRoute(
                      path: 'detail',
                      
                      pageBuilder: (context, state) =>
                          buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child:
                            BookDetailScreen(book: state.extra as Book ),
                      ),
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const SearchBooksScreen(
                
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
