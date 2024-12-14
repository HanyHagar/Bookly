import 'package:bookly_app/features/home/data/models/views_model/book_model.dart';

class SimilarBookStates {}
class InitialState extends SimilarBookStates{}
class SimilarBookLoading extends SimilarBookStates{}
class SimilarBookSuccess extends SimilarBookStates{
  final List<BookModel> books;

  SimilarBookSuccess({required this.books});
}
class SimilarBookFailure extends SimilarBookStates{
  final String error;

  SimilarBookFailure({required this.error});
}