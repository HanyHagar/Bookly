import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_bloc_opserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBookCubit(getIt.get<HomeRepoImpl>())..fetchFeatureBook(),
        ),
        BlocProvider(
          create: (context) => NewestBookCubit(getIt.get<HomeRepoImpl>())..fetchNewestBook(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(context),
        themeMode: ThemeMode.dark,
        routerConfig: AppRouter.router,
      ),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
          scaffoldBackgroundColor: const Color(0xff100B20),
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
              iconColor: WidgetStatePropertyAll(Colors.white),
            ),
          ),
          textTheme: buildTextTheme(context));
  }

  ThemeData lightTheme() {
    return ThemeData(
        scaffoldBackgroundColor: const Color(0xff100B20),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
        ),
      );
  }

  TextTheme buildTextTheme(BuildContext context) {
    return TextTheme(
            labelMedium: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width / 15,
                fontWeight: FontWeight.normal,
                fontFamily: 'Itim'),
            displayLarge: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 10,
                fontWeight: FontWeight.bold,
                fontFamily: 'Itim'),
            displayMedium: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Itim'),
            displaySmall: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Itim'),
            bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Itim'),
            bodyMedium: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 25,
                fontWeight: FontWeight.normal,
                fontFamily: 'Itim'),
            bodySmall: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Itim'),
          );
  }
}
