import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => GoRouter.of(context).push(AppRouter.kHomeView),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SplashScreenBody(
          image: "assets/images/bookly.svg",
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          name: 'Bookly App',
          fontColor: Colors.white,
        ),
      ),
    );
  }
}
