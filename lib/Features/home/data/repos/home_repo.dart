import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo 
{
  Future<List<BookModel>> fetchNewestBooks();
  Future<List<BookModel>> fetchFeaturedBooks();
  Future<List<BookModel>> fetchSimilarBooks({required String category});
}