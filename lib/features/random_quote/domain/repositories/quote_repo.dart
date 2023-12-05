import 'package:quotes/features/random_quote/domain/entities/quote.dart';

abstract class QuoteRepo {
  Future<Quote> getRandomQuote();
}
