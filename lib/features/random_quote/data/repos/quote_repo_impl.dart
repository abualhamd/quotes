import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/constants.dart';
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
  Future<Quote> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      final remoteRandomQuote =
          await randomQuoteRemoteDataSource.getRandomQuote();
      randomQuoteLocalDataSource.cacheQuote(quoteModel: remoteRandomQuote);

      return remoteRandomQuote;
    } else {
      final localRandomQuote = await randomQuoteLocalDataSource.getLastQuote();

      Constants.showToast(
          msg: AppStrings.checkYourInternetConnetion, color: Colors.red);
      return localRandomQuote;
    }
  }
}
