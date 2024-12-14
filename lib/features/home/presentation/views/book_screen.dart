import 'package:bookly_app/features/home/presentation/views/widgets/book_screen_body.dart';
import 'package:flutter/material.dart';

import '../../data/models/views_model/book_model.dart';


class BookScreen extends StatelessWidget {
  final List<BookModel> books;
  final int openBookIndex;
  const BookScreen({
    super.key,required this.openBookIndex, required this.books,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: BookScreenBody(books: books,openBookIndex: openBookIndex,),
            )
          ],
        ),
      ),
    );
  }
}
