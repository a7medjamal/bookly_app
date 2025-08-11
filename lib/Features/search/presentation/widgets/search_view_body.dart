import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});
  final TextEditingController _searchController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(FontAwesomeIcons.arrowLeft),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(FontAwesomeIcons.magnifyingGlass),
                        onPressed: () {},
                      ),
                      hintText: 'Search for books',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onSubmitted: (value) {},
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
