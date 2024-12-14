import 'package:bookly_app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/navigator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_book_states.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/views_model/book_model.dart';
import 'package:flutter/cupertino.dart';

class ListOfBookDetails extends StatelessWidget {
  final double widthScreen;
  final double heightScreen;
  const ListOfBookDetails(
      {super.key,
      required this.widthScreen,
      required this.heightScreen,
      });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBookCubit, NewestBookStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is NewestBookSuccess){
          return SuccessBody(
              books: state.books, widthScreen: widthScreen, heightScreen: heightScreen);
        }
        else if(state is NewestBookFailure){
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
    required this.books,
    required this.widthScreen,
    required this.heightScreen,
  });

  final List<BookModel> books;
  final double widthScreen;
  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                NavigatorMethods.navigatorToBookScreen(context, index, books);
              },
              child: CustomBookDetails(
                  widthScreen: widthScreen,
                  heightScreen: heightScreen,
                  bookModel: books[index]),
            ));
  }
}
