import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/data/repos/quote_repo_impl.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quote/presentation/cubit/quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  /// Features

  // cubit
  sl.registerFactory(() => QuoteCubit(getRandomQuoteUseCase: sl()));

  // usecases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepo: sl()));

  // repos
  sl.registerLazySingleton<QuoteRepo>(() => QuoteRepoImpl(
        randomQuoteLocalDataSource: sl(),
        randomQuoteRemoteDataSource: sl(),
        networkInfo: sl(),
      ));
  // data sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(
            sharedPreferences: sl(),
          ));

  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(client: sl()));

  /// Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
