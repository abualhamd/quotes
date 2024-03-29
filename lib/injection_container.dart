import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/data/repos/quote_repo_impl.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quote/presentation/cubit/quote_cubit.dart';
import 'package:quotes/features/splash/data/datasources/local_data_source.dart';
import 'package:quotes/features/splash/data/repositories/lang_repo_impl.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repo.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:quotes/features/splash/domain/usecases/get_lang_usecase.dart';
import 'package:quotes/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/api/app_interceptors.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features

  // cubit
  sl.registerFactory<QuoteCubit>(() => QuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory<LocaleCubit>(
    () => LocaleCubit(
      changeLangUseCase: sl(),
      getSavedLangUsecase: sl(),
    ),
  ); //getRandomQuoteUseCase: sl()

  // usecases
  //*randomQuote feature
  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRepo: sl()));
  //*splash feature
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepo: sl()));
  sl.registerLazySingleton<GetSavedLangUsecase>(
      () => GetSavedLangUsecase(langRepo: sl()));

  // repos
  sl.registerLazySingleton<QuoteRepo>(() => QuoteRepoImpl(
        randomQuoteLocalDataSource: sl(),
        randomQuoteRemoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<LangRepo>(
      () => LangRepoImpl(localDataSourceImpl: sl()));

  // data sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(
            sharedPreferences: sl(),
          ));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<SplashLocalDataSourceImpl>(
      () => SplashLocalDataSourceImpl(sharedPref: sl()));

  /// Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  sl.registerLazySingleton(() => Dio());
}
