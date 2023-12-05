import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api/api_consumer.dart';
import '../core/api/dio_consumer.dart';
import '../core/network/network_info.dart';
import '../features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import '../features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import '../features/random_quote/data/repos/quote_repo_impl.dart';
import '../features/random_quote/domain/entities/quote.dart';
import '../features/random_quote/domain/repositories/quote_repo.dart';

part 'providers.g.dart';

//? use cases
@riverpod
Future<Quote> randomQuoteUsecase(RandomQuoteUsecaseRef ref) {
  return ref.watch(_randomQuoteRepoProvider).getRandomQuote();
}

//? repos
@Riverpod(keepAlive: true)
QuoteRepo _randomQuoteRepo(_RandomQuoteRepoRef ref) {
  return QuoteRepoImpl(
    networkInfo: ref.watch(_networkInfoProvider),
    randomQuoteLocalDataSource: ref.watch(_randomQutoeLocalDataSourceProvider),
    randomQuoteRemoteDataSource:
        ref.watch(_randomQuoteRemoteDataSourceProvider),
  );
}

//? data sources
//* random quote
@Riverpod(keepAlive: true)
RandomQuoteLocalDataSource _randomQutoeLocalDataSource(
    _RandomQutoeLocalDataSourceRef ref) {
  return RandomQuoteLocalDataSourceImpl(
      sharedPreferences: ref.watch(sharedPrefsProvider));
}

@Riverpod(keepAlive: true)
RandomQuoteRemoteDataSource _randomQuoteRemoteDataSource(
    _RandomQuoteRemoteDataSourceRef ref) {
  return RandomQuoteRemoteDataSourceImpl(
      apiConsumer: ref.watch(_apiConsumerProvider));
}

//? core
@Riverpod(keepAlive: true)
NetworkInfo _networkInfo(_NetworkInfoRef ref) {
  return NetworkInfoImpl(
      internetConnectionChecker: ref.watch(_connectionCheckerProvider));
}

@Riverpod(keepAlive: true)
ApiConsumer _apiConsumer(_ApiConsumerRef ref) {
  return DioConsumer(client: ref.watch(_dioProvider));
}

//? external
//* shared prefs
@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}

//* dio
@Riverpod(keepAlive: true)
Dio _dio(_DioRef ref) {
  return Dio();
}

//* connection checker
@Riverpod(keepAlive: true)
InternetConnectionChecker _connectionChecker(_ConnectionCheckerRef ref) {
  return InternetConnectionChecker();
}
