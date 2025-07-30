part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  const SimilarBooksFailure(this.errMessage);
  final String errMessage;
}

class SimilarBooksSuccess extends SimilarBooksState {
  const SimilarBooksSuccess(this.books);
  final List<BookModel> books;
}
