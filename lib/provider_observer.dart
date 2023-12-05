import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';


class MyObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log('::: Provider ${provider.name} was initialized with $value :::');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log('::: Provider $provider was disposed :::');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('::: Provider ${provider.name} updated from $previousValue to $newValue :::');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log('::: Provider $provider threw $error at $stackTrace :::');
  }
}
