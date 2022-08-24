import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repo.dart';

import '../../../../core/network/network_info.dart';
import '../data_sources/random_quote_local_data_source.dart';
import '../data_sources/random_quote_remote_data_source.dart';

class QuoteRepoImpl implements QuoteRepo {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepoImpl(
      {required this.networkInfo,
      required this.randomQuoteLocalDataSource,
      required this.randomQuoteRemoteDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async{
    if(await networkInfo.isConnected){
      try{
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(quoteModel: remoteRandomQuote);

        return Right(remoteRandomQuote);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      try{
        final localRandomQuote =
            await randomQuoteLocalDataSource.getLastQuote();

        return Right(localRandomQuote);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}
