import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({
    required String query,
  }) async {
    try {
      var response = await apiService.get(
        endPoint: '/books/v1/volumes?q=intitle:$query',
      );
      List<BookModel> books = [];
      for (var item in response.data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
