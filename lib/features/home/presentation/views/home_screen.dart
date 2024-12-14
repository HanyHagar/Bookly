import 'package:bookly_app/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: HomeScreenBody(
          widthScreen: mediaQuery.width,
          heightScreen: mediaQuery.height,
        ),
      ),
    );
  }
}
