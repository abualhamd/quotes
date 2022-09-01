import 'package:quotes/features/favorite_quote/presentation/favorite_quote_screen.dart';
import 'package:quotes/features/splash/presentation/screens/splash_screen.dart';
import '../../features/random_quote/presentation/screens/quote_screen.dart';

class Routes {
  static const String randomQuoteRoute = '/QuoteScreen';
  static const String splashRoute = '/SplashScreen';
  static const String favoriteQuoteRoute = '/favoriteQuote';
}

final routes = {
  Routes.randomQuoteRoute: (context) => const QuoteScreen(),
  Routes.favoriteQuoteRoute: (context) => const FavoriteQuoteScreen(),
  Routes.splashRoute: (context) => const SplashScreen(),
};
