import 'package:quotes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/core/usecases/usecases.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repo.dart';

class GetSavedLangUsecase implements UseCase<String, NoParams> {
  final LangRepo _langRepo;

  GetSavedLangUsecase({required LangRepo langRepo}) : _langRepo = langRepo;

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return _langRepo.getSavedLang();
  }
}
