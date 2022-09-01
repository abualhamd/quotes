import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/splash/data/datasources/local_data_source.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repo.dart';

class LangRepoImpl implements LangRepo {
  final SplashLocalDataSourceImpl _localDataSourceImpl;

  LangRepoImpl({required SplashLocalDataSourceImpl localDataSourceImpl})
      : _localDataSourceImpl = localDataSourceImpl;

  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      return Right(await _localDataSourceImpl.changeLang(langCode));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      return Right(await _localDataSourceImpl.getSavedLang());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
