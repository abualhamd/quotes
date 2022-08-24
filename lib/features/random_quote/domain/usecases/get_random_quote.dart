import 'package:dartz/dartz.dart';
import 'package:quotes/core/usecases/usecases.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repo.dart';
import '../../../../core/error/failures.dart';
import '../entities/quote.dart';

class GetRandomQuote implements UseCase<Quote, NoParams>{
  final QuoteRepo quoteRepo;

  GetRandomQuote({required this.quoteRepo});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepo.getRandomQuote();
  }

}





