import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_book_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookStates> {
  NewestBookCubit(this.homeRepo) : super(InitialState());
  static NewestBookCubit get(context) =>
      BlocProvider.of<NewestBookCubit>(context);
  final HomeRepo homeRepo;
  Future<void> fetchNewestBook() async {
    emit(NewestBookLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBookFailure(error: failure.errMessage));
    }, (books) {
      emit(NewestBookSuccess(books: books));
    });
  }
}
