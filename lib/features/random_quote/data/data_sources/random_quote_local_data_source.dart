import 'dart:convert';

import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/utils/app_strings.dart';

import '../models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource{
  Future<QuoteModel> getLastQuote();
  Future<void> cacheQuote({required QuoteModel quoteModel});

}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource{
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheQuote({required QuoteModel quoteModel}) async {
    await sharedPreferences.setString(AppStrings.cachedQuote, json.encode(quoteModel));
  }

  @override
  Future<QuoteModel> getLastQuote() {
    final String? jsonString = sharedPreferences.getString(AppStrings.cachedQuote);
    if(jsonString != null) {
      final QuoteModel cachedQuote = QuoteModel.fromJson(json.decode(jsonString));
      return Future.value(cachedQuote);
    }
    else{
      throw CacheException();
    }
  }

}