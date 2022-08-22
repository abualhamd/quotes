import 'package:quotes/features/favorite_quote/presentation/favorite_quote_screen.dart';
import '../../features/random_quote/presentation/screens/quote_screen.dart';

class Routes {
  static const String initialRoute = '/QuoteScreen';
  static const String favoriteQuoteRoute = '/favoriteQuote';
}

final routes = {
  Routes.initialRoute: (context) => const QuoteScreen(),
  Routes.favoriteQuoteRoute: (context) => const FavoriteQuoteScreen(),
};
