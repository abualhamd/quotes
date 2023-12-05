import 'package:quotes/injection_providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/app_strings.dart';

part 'locale_provider.g.dart';

@riverpod
class LanguageCode extends _$LanguageCode {
  @override
  FutureOr<String> build() async {
    return ref.watch(getSavedLangUsecaseProvider.future);
  }

  FutureOr<bool> changeLang() async {
    final nextLanguageCode = (state.value == AppStrings.englishCode)
        ? AppStrings.arabicCode
        : AppStrings.englishCode;

    final val =
        await ref.read(changeLangUsecaseProvider(nextLanguageCode).future);

    if (val) {
      state = AsyncData(nextLanguageCode);
    }
    return val;
  }
}
