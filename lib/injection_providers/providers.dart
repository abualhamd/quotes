import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/api/app_interceptors.dart';
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
import '../features/splash/data/datasources/local_data_source.dart';
import '../features/splash/data/repositories/lang_repo_impl.dart';
import '../features/splash/domain/repositories/lang_repo.dart';

part 'providers.g.dart';

//? use cases
//* random quote
@riverpod
Future<Quote> randomQuoteUsecase(RandomQuoteUsecaseRef ref) {
  return ref.watch(_randomQuoteRepoProvider).getRandomQuote();
}

//* lange & locale
@riverpod
FutureOr<bool> changeLangUsecase(ChangeLangUsecaseRef ref, String langCode) {
  return ref.watch(_langRepoProvider).changeLang(langCode: langCode);
}

@riverpod
FutureOr<String> getSavedLangUsecase(GetSavedLangUsecaseRef ref) {
  return ref.watch(_langRepoProvider).getSavedLang();
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

@Riverpod(keepAlive: true)
LangRepo _langRepo(_LangRepoRef ref) {
  return LangRepoImpl(
      localDataSource: ref.watch(_splashLocalDataSourceProvider));
}

//? data sources
//* random quote
@Riverpod(keepAlive: true)
RandomQuoteLocalDataSource _randomQutoeLocalDataSource(
    _RandomQutoeLocalDataSourceRef ref) {
  return RandomQuoteLocalDataSourceImpl(
      sharedPreferences: ref.watch(sharedPrefsProvider));
}

//* splash
@Riverpod(keepAlive: true)
SplashLocalDataSource _splashLocalDataSource(_SplashLocalDataSourceRef ref) {
  return SplashLocalDataSourceImpl(sharedPref: ref.watch(sharedPrefsProvider));
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
  return DioConsumer(
    client: ref.watch(_dioProvider),
    appInterceptors: ref.watch(_appInterceptorsProvider),
    logInterceptor: ref.watch(_logInterceptorProvider),
  );
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

@Riverpod(keepAlive: true)
AppInterceptors _appInterceptors(_AppInterceptorsRef ref) {
  return AppInterceptors();
}

@Riverpod(keepAlive: true)
LogInterceptor _logInterceptor(_LogInterceptorRef ref) {
  return LogInterceptor(
    requestBody: true,
    responseBody: true,
  );
}

//* connection checker
@Riverpod(keepAlive: true)
InternetConnectionChecker _connectionChecker(_ConnectionCheckerRef ref) {
  return InternetConnectionChecker();
}
