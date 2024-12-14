import 'package:bookly_app/features/home/data/models/views_model/book_model.dart';
import 'package:go_router/go_router.dart';

class FeatureBookStates {}
class InitialState extends FeatureBookStates{

}
class FeatureBookLoading extends FeatureBookStates{}
class FeatureBookSuccess extends FeatureBookStates{
  final List<BookModel> books;

  FeatureBookSuccess({required this.books});
}
class FeatureBookFailure extends FeatureBookStates{
  final String error;

  FeatureBookFailure({required this.error});
}