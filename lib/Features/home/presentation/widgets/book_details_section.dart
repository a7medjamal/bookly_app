import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/widgets/book_action.dart';
import 'package:bookly_app/Features/home/presentation/widgets/custom_book_image_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.25),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
          ),
        ),
        const SizedBox(height: 33),
        Text(bookModel.volumeInfo!.title!, style: Styles.textStyle30),
        const SizedBox(height: 4),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 4.8,
          count: '5000+',
        ),
        const SizedBox(height: 37),
        BooksAction(bookModel: bookModel),
      ],
    );
  }
}
