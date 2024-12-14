import 'package:bookly_app/features/home/data/models/views_model/book_model.dart';

class NewestBookStates {}
class InitialState extends NewestBookStates{}
class NewestBookLoading extends NewestBookStates{}
class NewestBookSuccess extends NewestBookStates{
  final List<BookModel> books;

  NewestBookSuccess({required this.books});
}
class NewestBookFailure extends NewestBookStates{
  final String error;

  NewestBookFailure({required this.error});
}