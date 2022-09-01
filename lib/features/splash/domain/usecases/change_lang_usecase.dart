import 'package:quotes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/core/usecases/usecases.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repo.dart';

class ChangeLangUseCase implements UseCase<bool, String> {
  final LangRepo _langRepo;

  ChangeLangUseCase({required LangRepo langRepo}) : _langRepo = langRepo;

  @override
  Future<Either<Failure, bool>> call(String langCode) async {
    return await _langRepo.changeLang(langCode: langCode);
  }
}
