import 'package:bookly_app/Features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Features/home/presentation/widgets/similar_books_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                  child: CustomBookImage(),
                ),
                const SizedBox(height: 33),
                Text('The Jungle Book', style: Styles.textStyle30),
                const SizedBox(height: 4),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    'Rudyard Kipling',
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                const SizedBox(height: 37),
                BooksAction(),
                Expanded(child: const SizedBox(height: 40)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const SimilarBooksListView(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ],
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
    //   child: Column(
    //     children: [
    //       CustomBookDetailsAppBar(),
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: width * 0.25),
    //         child: CustomBookImage(),
    //       ),
    //       const SizedBox(height: 33),
    //       Text('The Jungle Book', style: Styles.textStyle30),
    //       const SizedBox(height: 4),
    //       Opacity(
    //         opacity: 0.7,
    //         child: Text(
    //           'Rudyard Kipling',
    //           style: Styles.textStyle18.copyWith(
    //             fontWeight: FontWeight.w500,
    //             fontStyle: FontStyle.italic,
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       const BookRating(mainAxisAlignment: MainAxisAlignment.center),
    //       const SizedBox(height: 37),
    //       BooksAction(),
    //       Expanded(child: const SizedBox(height: 40)),
    //       Align(
    //         alignment: Alignment.centerLeft,
    //         child: Text(
    //           'You can also like',
    //           style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w900),
    //         ),
    //       ),
    //       const SizedBox(height: 16),
    //       const SimilarBooksListView(),
    //       const SizedBox(height: 25),
    //     ],
    //   ),
    // );
  }
}
