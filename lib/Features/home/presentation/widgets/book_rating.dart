import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.mainAxisAlignment});
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 16,
          color: Color(0xFFFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text('4.8', style: Styles.textStyle16.copyWith(color: Colors.white)),
        const SizedBox(width: 5),
        Opacity(opacity: 0.5, child: Text('(2300)', style: Styles.textStyle14)),
      ],
    );
  }
}
