import 'package:bookly_app/features/home/data/models/views_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/book_screen.dart';
import 'package:bookly_app/features/home/presentation/views/home_screen.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kAnimationTime = 4;
  static const kSplashView = '/splashView';
  static const kHomeView = '/homeView';
  static const kBookView = '/bookView';

  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: <RouteBase>[
      // Splash screen route
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashScreen(),
      ),
      // Home screen route with custom transitions (Fade and Slide)
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomeScreen(),
          transitionDuration: const Duration(seconds: (kAnimationTime+1)),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Start from right
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        ),
      ),
      // Book screen route with custom transition (Scale)
      GoRoute(
        path: kBookView,
        pageBuilder: (context, state) {
          Map<String, Object> data = state.extra as Map<String, Object>;
          final  books = data['books'] as List<BookModel>; // Get the BookModel passed via extra
          final openBookIndex = data['openBookIndex'] as int;  // Get the BookModel passed via extra
          return CustomTransitionPage(
            child: BookScreen(books: books,openBookIndex: openBookIndex,),  // Pass the BookModel to BookScreen
            transitionDuration: const Duration(seconds: kAnimationTime),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
