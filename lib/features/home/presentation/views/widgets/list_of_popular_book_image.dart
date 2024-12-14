import 'package:bookly_app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/navigator.dart';
import 'package:bookly_app/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/feature_books_cubit/feature_books_states.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_popular_book_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/views_model/book_model.dart';
import 'package:flutter/material.dart';

int i = 0;

class ListOfFeatureBookImage extends StatelessWidget {
  final double listWidth;
  final double screenWidth;
  final double screenHeight;

  const ListOfFeatureBookImage({
    super.key,
    required this.screenHeight,
    this.listWidth = double.infinity,
    required this.screenWidth,

  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBookCubit,FeatureBookStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is FeatureBookSuccess){
          return SuccessBody(listWidth: listWidth, screenHeight: screenHeight, books: state.books, screenWidth: screenWidth);
        }
        else if(state is FeatureBookFailure){
          return CustomErrorWidget(error: state.error,);
        }
        else{
          return const CustomCircularProgressIndicator();
        }

      },
    );
  }

}



class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.listWidth,
    required this.screenHeight,
    required this.books,
    required this.screenWidth,
  });

  final double listWidth;
  final double screenHeight;
  final List<BookModel> books;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: listWidth,
      height: screenHeight / 3.5 ,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              NavigatorMethods.navigatorToBookScreen(context, index,books);
            },
            child: CustomFeatureBookImage(
              width: screenWidth / 2.5,
              height:screenHeight / 3.5,
              image: books[index].thumbnail,
              spaceBeforeElement: screenWidth / 30,
            ),
          );
        },
      ),
    );
  }
}
