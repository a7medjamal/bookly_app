import 'package:bookly_app/Features/search/presentation/widgets/search_view_body.dart';
import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SearchViewBody(bookModel: bookModel)),
    );
  }
}
