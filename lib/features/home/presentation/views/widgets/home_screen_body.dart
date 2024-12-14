import 'package:bookly_app/features/home/presentation/views/widgets/list_of_book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/list_of_popular_book_image.dart';
import 'package:flutter/material.dart';

import 'custom_home_screen_appbar.dart';

class HomeScreenBody extends StatelessWidget {
  final double widthScreen;
  final double heightScreen;
  const HomeScreenBody(
      {super.key, required this.widthScreen, required this.heightScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHomeScreenAppbar(),
        Expanded(
          flex: 1,
          child: ListOfFeatureBookImage(
            screenWidth: widthScreen,
            screenHeight: heightScreen,
          ),
        ),
        SizedBox(
          height: heightScreen / 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Best Seller',
            style: TextStyle(
                color: Colors.white,
                fontSize: widthScreen / 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Chokokutai'),
          ),
        ),
        Expanded(
            flex: 2,
            child: ListOfBookDetails(
                widthScreen: widthScreen, heightScreen: heightScreen))
      ],
    );
  }
}
