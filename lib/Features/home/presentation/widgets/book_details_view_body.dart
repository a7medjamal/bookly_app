import 'package:bookly_app/Features/home/presentation/widgets/books_details_section.dart';
import 'package:bookly_app/Features/home/presentation/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: const [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                Expanded(child: SizedBox(height: 40)),
                SimilarBooksSection(),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ],
    );
  }
}