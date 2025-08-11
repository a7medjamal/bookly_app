import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;
  Future<void> searchBooks({required String query}) async {
    emit(SearchBooksLoading());
    final result = await searchRepo.searchBooks(query: query);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(failure.message));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
