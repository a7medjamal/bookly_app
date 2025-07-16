import 'package:bookly_app/Features/home/presentation/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/home_view.dart';
import 'package:bookly_app/Features/search/presentation/search_view.dart';
import 'package:bookly_app/Features/splash/presentation/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kBookDetailsView = '/bookDetailsView';
  static const String kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
