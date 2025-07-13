import 'package:bookly_app/Features/home/presentation/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/home_view.dart';
import 'package:bookly_app/Features/splash/presentation/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String kHomeView = '/home';
  static const String kBookDetailsView = '/bookDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
