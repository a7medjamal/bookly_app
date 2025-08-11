import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/functions/launch_custom_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text: 'Free',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                await launchCustomUrl(
                  bookModel.volumeInfo!.previewLink!,
                  context,
                );
              },
              backgroundColor: const Color(0xFFEF8262),
              textColor: Colors.white,
              text: getText(bookModel),
              fontSize: 16,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo!.previewLink != null) {
    return 'Preview';
  } else {
    return 'Not Available';
  }
}
