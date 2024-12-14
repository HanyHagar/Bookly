import 'dart:developer';

import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/feature_books_cubit/feature_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookCubit extends Cubit<FeatureBookStates> {
  FeatureBookCubit(this.homeRepo) : super(InitialState());
  static FeatureBookCubit get(context) =>
      BlocProvider.of<FeatureBookCubit>(context);
  final HomeRepo homeRepo;
  Future<void> fetchFeatureBook() async {
    emit(FeatureBookLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      log(failure.errMessage);
      emit(FeatureBookFailure(error: failure.errMessage));
    }, (books) {
      emit(FeatureBookSuccess(books: books));
    });
  }
}
