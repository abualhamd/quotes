import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/usecases/usecases.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:quotes/features/splash/domain/usecases/get_lang_usecase.dart';
import '../../../../config/routes/app_routes.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit({
    required ChangeLangUseCase changeLangUseCase,
    required GetSavedLangUsecase getSavedLangUsecase,
  })  : _changeLangUseCase = changeLangUseCase,
        _getSavedLangUsecase = getSavedLangUsecase,
        super(LocaleInitState());

  static LocaleCubit get(BuildContext context) => BlocProvider.of(context);

  final ChangeLangUseCase _changeLangUseCase;
  final GetSavedLangUsecase _getSavedLangUsecase;
  String currentLangCode = AppStrings.englishCode;

  void navigateToHomeScreen(BuildContext context) {
    emit(LocaleShowSplash());
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute);
    });
  }

  void getSavedLanguage() async {
    emit(LocaleGetLanguageLoadingState());
    final resoponse = await _getSavedLangUsecase(NoParams());

    resoponse.fold(
        (failure) => {
              debugPrint(AppStrings.cacheFailure),
              // TODO do something to handle this case
              emit(LocaleGetLanguageFailureState())
            },
        (langCode) => {
              currentLangCode = langCode,
              debugPrint('current Lang Code: $currentLangCode'),
              emit(LocaleGetLanguageSuccessState())
            });
  }

  void changeLanguage() async {
    emit(LocaleChangeLanguageInitState());

    final nextLanguageCode = (currentLangCode == AppStrings.englishCode)
        ? AppStrings.arabicCode
        : AppStrings.englishCode;
    final response = await _changeLangUseCase(nextLanguageCode);

    response.fold(
        (failure) => {
              debugPrint(AppStrings.cacheFailure),
              emit(LocaleChangeLanguageFailureState()),
            },
        (value) => {
              // getSavedLanguage(),
              currentLangCode = nextLanguageCode,
              emit(LocaleChangeLanguageSuccessState()),
            });
  }
}
