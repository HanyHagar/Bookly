import 'package:bookly_app/core/utils/app_routes.dart' as navigator;
import 'package:bookly_app/features/home/data/models/views_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorMethods{
  static void navigatorToBookScreen(BuildContext context, int index,List<BookModel> books) {
    GoRouter.of(context).push(
      navigator.AppRouter.kBookView,
      extra: {
        'books': books,
        'openBookIndex': index,
      },
    );
  }
}