import 'package:quotes/features/splash/data/datasources/local_data_source.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repo.dart';

class LangRepoImpl implements LangRepo {
  final SplashLocalDataSource _localDataSource;

  LangRepoImpl({required SplashLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<bool> changeLang({required String langCode}) async {
    return await _localDataSource.changeLang(langCode);
  }

  @override
  Future<String> getSavedLang() async {
    return await _localDataSource.getSavedLang();
  }
}
