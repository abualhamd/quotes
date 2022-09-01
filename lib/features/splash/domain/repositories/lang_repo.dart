import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';

abstract class LangRepo {
  Future<Either<Failure, String>> getSavedLang();
  Future<Either<Failure, bool>> changeLang({required String langCode});
}
