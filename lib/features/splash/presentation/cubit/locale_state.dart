part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  const LocaleState();

  @override
  List<Object> get props => [];
}

class LocaleInitState extends LocaleState {}

class LocaleShowSplash extends LocaleState {}

class LocaleGetLanguageLoadingState extends LocaleState {}

class LocaleGetLanguageSuccessState extends LocaleState {}

class LocaleGetLanguageFailureState extends LocaleState {}

class LocaleChangeLanguageInitState extends LocaleState {}

class LocaleChangeLanguageSuccessState extends LocaleState {}

class LocaleChangeLanguageFailureState extends LocaleState {}
