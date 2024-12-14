import 'package:bookly_app/core/widgets/navigator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import '../../../data/models/views_model/book_model.dart';
import 'package:flutter/material.dart';

class ListOfAlsoLike extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final int openBookIndex;
  final List<BookModel> books;
  const ListOfAlsoLike({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.books,
    required this.openBookIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        bool isOpenBook;
        if (openBookIndex == index) {
          isOpenBook = true;
        } else {
          isOpenBook = false;
        }
        return GestureDetector(
          onTap: () {
            NavigatorMethods.navigatorToBookScreen(context, index, books);
          },
          child: isOpenBook
              ? Container()
              : CustomBookImage(
                  width: screenWidth / 3,
                  height: screenHeight / 20,
                  image: books[index].thumbnail,
                  spaceBeforeElement: screenWidth / 30,
                ),
        );
      },
    );
  }
}
