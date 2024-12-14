import '../../../data/models/views_model/book_model.dart';
import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class CustomBookDetails extends StatelessWidget {
  final double widthScreen;
  final double heightScreen;
  final BookModel bookModel;

  const CustomBookDetails(
      {super.key,
      required this.widthScreen,
      required this.heightScreen, required this.bookModel,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: heightScreen/35,),
        Row(
          children: [
            CustomBookImage(
                width: widthScreen / 4,
                height: heightScreen / 8,
                image: bookModel.thumbnail,
                spaceBeforeElement: widthScreen / 30),
            SizedBox(
              width: widthScreen / 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    bookModel.author,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          bookModel.amount,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.amberAccent,
                                    size: widthScreen / 20),
                                Text(
                                  bookModel.averageRating.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Text(
                              '(${bookModel.ratingCount.toString()})',
                              style: Theme.of(context).textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
