import 'package:quotes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashLocalDataSource {
  Future<bool> changeLang(String langCode);
  Future<String> getSavedLang();
}

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SharedPreferences _sharedPref;

  SplashLocalDataSourceImpl({required SharedPreferences sharedPref})
      : _sharedPref = sharedPref;

  @override
  Future<bool> changeLang(String langCode) async {
    return await _sharedPref.setString(AppStrings.locale, langCode);
  }

  @override
  Future<String> getSavedLang() async {
    final response = _sharedPref.getString(AppStrings.locale);
    if (response != null) {
      return response;
    } else {
      await changeLang(AppStrings.englishCode);
      return AppStrings.englishCode;
    }
    // return _sharedPref.getString(AppStrings.locale) ?? AppStrings.englishCode;
  }
}
