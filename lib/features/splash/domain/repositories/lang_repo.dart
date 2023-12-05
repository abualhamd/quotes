abstract class LangRepo {
  Future<String> getSavedLang();
  Future<bool> changeLang({required String langCode});
}
