import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/views_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure,List<BookModel>>> fetchFeatureBooks();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBooks(String query);

}