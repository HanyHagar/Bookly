import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/views_model/book_model.dart';
import 'custom_book_image.dart';
import 'custom_book_screen_appbar.dart';
import 'list_of_also_like.dart';

class BookScreenBody extends StatelessWidget {
  final List<BookModel> books;
  final int openBookIndex;

  const BookScreenBody(
      {super.key, required this.books, required this.openBookIndex});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var book = books[openBookIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomBookScreenAppbar(),
        CustomBookImage(
            width: mediaQuery.width / 2,
            height: mediaQuery.height / 3.5,
            image: book.thumbnail,
            spaceBeforeElement: 0),
        SizedBox(
          height: mediaQuery.height / 35,
        ),
        Text(
          book.title,
          style: Theme.of(context).textTheme.displayLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: mediaQuery.height / 50,
        ),
        Text(
          book.author,
          style: Theme.of(context).textTheme.displaySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: mediaQuery.height / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.star,
                    color: Colors.amberAccent, size: mediaQuery.width / 20),
                Text(
                  book.averageRating.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Text(
              '   (${book.ratingCount})',
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        SizedBox(
          height: mediaQuery.height / 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: mediaQuery.width / 3,
              height: mediaQuery.height / 20,
              onPressed: () {},
              text: book.amount,
              backgroundColor: const Color(0xffFFFFFF),
              padding: const EdgeInsets.all(10),
              textStyle: Theme.of(context).textTheme.labelMedium,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10),
                bottomStart: Radius.circular(10),
              )),
            ),
            CustomButton(
                width: mediaQuery.width / 3,
                height: mediaQuery.height / 20,
                onPressed: () async {
                  var url = Uri.parse(book.previewLink);
                  await launchUrl(
                      url,

                  );
                },
                text: 'Free Preview',
                backgroundColor: const Color(0xffEF8262),
                padding: const EdgeInsets.all(10),
                textStyle: Theme.of(context).textTheme.bodyMedium,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10),
                    bottomEnd: Radius.circular(10),
                  ),
                )),
          ],
        ),
        Expanded(
          child: SizedBox(
            height: mediaQuery.height / 35,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'You can also like',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: mediaQuery.width / 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Itim'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: mediaQuery.height / 45,
        ),
        SizedBox(
            height: mediaQuery.height / 6,
            child: ListOfAlsoLike(
              screenWidth: mediaQuery.width,
              screenHeight: mediaQuery.height,
              books: books,
              openBookIndex: openBookIndex,
            )),
        SizedBox(
          height: mediaQuery.height / 45,
        ),
      ],
    );
  }
}
