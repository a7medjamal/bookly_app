import 'package:bookly_app/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  final TextEditingController _searchController = TextEditingController();

  void _search(BuildContext context) {
    final query = _searchController.text.trim();

    if (query.isEmpty) {
      // Use bookModel if search is empty
      context.read<SearchBooksCubit>().searchBooks(
        query: bookModel.volumeInfo!.title ?? 'Computer Science',
      );
    } else {
      // Use search text
      context.read<SearchBooksCubit>().searchBooks(query: query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(FontAwesomeIcons.arrowLeft),
                        onPressed: () => GoRouter.of(context).pop(),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                        onPressed: () => _search(context),
                      ),
                      hintText: 'Search for books',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onSubmitted: (_) => _search(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
