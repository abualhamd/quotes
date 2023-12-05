import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';

// abstract class QuoteRepo{
//   Future<Either<Failure, Quote>> getRandomQuote();
// }
abstract class QuoteRepo{
  Future<Quote> getRandomQuote();
}