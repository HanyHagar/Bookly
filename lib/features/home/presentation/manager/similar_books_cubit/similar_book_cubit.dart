import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_book_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookCubit extends Cubit<SimilarBookStates> {
  SimilarBookCubit(this.homeRepo) : super(InitialState());
  static SimilarBookCubit get(context) =>
      BlocProvider.of<SimilarBookCubit>(context);
  final HomeRepo homeRepo;
  Future<void> fetchNewestBook() async {
    emit(SimilarBookLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(SimilarBookFailure(error: failure.errMessage));
    }, (books) {
      emit(SimilarBookSuccess(books: books));
    });
  }
}