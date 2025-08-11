part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  const SearchBooksSuccess(this.books);
  final List<BookModel> books;
}

class SearchBooksFailure extends SearchBooksState {
  const SearchBooksFailure(this.error);
  final String error;
}
