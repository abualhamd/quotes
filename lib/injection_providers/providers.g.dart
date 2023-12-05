// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomQuoteUsecaseHash() =>
    r'416c001ce1192d7eb775a6eea93b6ee7d791052c';

/// See also [randomQuoteUsecase].
@ProviderFor(randomQuoteUsecase)
final randomQuoteUsecaseProvider = AutoDisposeFutureProvider<Quote>.internal(
  randomQuoteUsecase,
  name: r'randomQuoteUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomQuoteUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RandomQuoteUsecaseRef = AutoDisposeFutureProviderRef<Quote>;
String _$changeLangUsecaseHash() => r'8fb254296b0dba70e60097d50d558540b281100e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [changeLangUsecase].
@ProviderFor(changeLangUsecase)
const changeLangUsecaseProvider = ChangeLangUsecaseFamily();

/// See also [changeLangUsecase].
class ChangeLangUsecaseFamily extends Family<AsyncValue<bool>> {
  /// See also [changeLangUsecase].
  const ChangeLangUsecaseFamily();

  /// See also [changeLangUsecase].
  ChangeLangUsecaseProvider call(
    String langCode,
  ) {
    return ChangeLangUsecaseProvider(
      langCode,
    );
  }

  @override
  ChangeLangUsecaseProvider getProviderOverride(
    covariant ChangeLangUsecaseProvider provider,
  ) {
    return call(
      provider.langCode,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'changeLangUsecaseProvider';
}

/// See also [changeLangUsecase].
class ChangeLangUsecaseProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [changeLangUsecase].
  ChangeLangUsecaseProvider(
    String langCode,
  ) : this._internal(
          (ref) => changeLangUsecase(
            ref as ChangeLangUsecaseRef,
            langCode,
          ),
          from: changeLangUsecaseProvider,
          name: r'changeLangUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$changeLangUsecaseHash,
          dependencies: ChangeLangUsecaseFamily._dependencies,
          allTransitiveDependencies:
              ChangeLangUsecaseFamily._allTransitiveDependencies,
          langCode: langCode,
        );

  ChangeLangUsecaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.langCode,
  }) : super.internal();

  final String langCode;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ChangeLangUsecaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChangeLangUsecaseProvider._internal(
        (ref) => create(ref as ChangeLangUsecaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        langCode: langCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ChangeLangUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChangeLangUsecaseProvider && other.langCode == langCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, langCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChangeLangUsecaseRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `langCode` of this provider.
  String get langCode;
}

class _ChangeLangUsecaseProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ChangeLangUsecaseRef {
  _ChangeLangUsecaseProviderElement(super.provider);

  @override
  String get langCode => (origin as ChangeLangUsecaseProvider).langCode;
}

String _$getSavedLangUsecaseHash() =>
    r'06d968c85e4f0f52aba1364d7ee74ace277efdcc';

/// See also [getSavedLangUsecase].
@ProviderFor(getSavedLangUsecase)
final getSavedLangUsecaseProvider = AutoDisposeFutureProvider<String>.internal(
  getSavedLangUsecase,
  name: r'getSavedLangUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSavedLangUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSavedLangUsecaseRef = AutoDisposeFutureProviderRef<String>;
String _$randomQuoteRepoHash() => r'0662f7617ad490677cb186eff77fb93c88574a5e';

/// See also [_randomQuoteRepo].
@ProviderFor(_randomQuoteRepo)
final _randomQuoteRepoProvider = Provider<QuoteRepo>.internal(
  _randomQuoteRepo,
  name: r'_randomQuoteRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomQuoteRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _RandomQuoteRepoRef = ProviderRef<QuoteRepo>;
String _$langRepoHash() => r'f8739fbd3c1af15969be7fe9663c586d3189f471';

/// See also [_langRepo].
@ProviderFor(_langRepo)
final _langRepoProvider = Provider<LangRepo>.internal(
  _langRepo,
  name: r'_langRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$langRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _LangRepoRef = ProviderRef<LangRepo>;
String _$randomQutoeLocalDataSourceHash() =>
    r'a7fb075aeb51563862a0d3e006f3f703eba808bc';

/// See also [_randomQutoeLocalDataSource].
@ProviderFor(_randomQutoeLocalDataSource)
final _randomQutoeLocalDataSourceProvider =
    Provider<RandomQuoteLocalDataSource>.internal(
  _randomQutoeLocalDataSource,
  name: r'_randomQutoeLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomQutoeLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _RandomQutoeLocalDataSourceRef
    = ProviderRef<RandomQuoteLocalDataSource>;
String _$splashLocalDataSourceHash() =>
    r'5ff7a1d9887264c28b548be243cc06d102316113';

/// See also [_splashLocalDataSource].
@ProviderFor(_splashLocalDataSource)
final _splashLocalDataSourceProvider = Provider<SplashLocalDataSource>.internal(
  _splashLocalDataSource,
  name: r'_splashLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$splashLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _SplashLocalDataSourceRef = ProviderRef<SplashLocalDataSource>;
String _$randomQuoteRemoteDataSourceHash() =>
    r'cd05d9b01a4cac7cc3891f8c771aad2d5512a0c6';

/// See also [_randomQuoteRemoteDataSource].
@ProviderFor(_randomQuoteRemoteDataSource)
final _randomQuoteRemoteDataSourceProvider =
    Provider<RandomQuoteRemoteDataSource>.internal(
  _randomQuoteRemoteDataSource,
  name: r'_randomQuoteRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomQuoteRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _RandomQuoteRemoteDataSourceRef
    = ProviderRef<RandomQuoteRemoteDataSource>;
String _$networkInfoHash() => r'8afbcd419eb2ea1b47e46b71bcea049e7bbfd081';

/// See also [_networkInfo].
@ProviderFor(_networkInfo)
final _networkInfoProvider = Provider<NetworkInfo>.internal(
  _networkInfo,
  name: r'_networkInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _NetworkInfoRef = ProviderRef<NetworkInfo>;
String _$apiConsumerHash() => r'ebaaa2e8bbd00b48ec5d7579e1db3cac27c79b72';

/// See also [_apiConsumer].
@ProviderFor(_apiConsumer)
final _apiConsumerProvider = Provider<ApiConsumer>.internal(
  _apiConsumer,
  name: r'_apiConsumerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiConsumerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _ApiConsumerRef = ProviderRef<ApiConsumer>;
String _$sharedPrefsHash() => r'394954be62ac9fcd757598b97278fd4215bc6410';

/// See also [sharedPrefs].
@ProviderFor(sharedPrefs)
final sharedPrefsProvider = Provider<SharedPreferences>.internal(
  sharedPrefs,
  name: r'sharedPrefsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sharedPrefsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPrefsRef = ProviderRef<SharedPreferences>;
String _$dioHash() => r'b445ce501e961f53f049583e23fea68c8edd18d5';

/// See also [_dio].
@ProviderFor(_dio)
final _dioProvider = Provider<Dio>.internal(
  _dio,
  name: r'_dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _DioRef = ProviderRef<Dio>;
String _$appInterceptorsHash() => r'8e10e447a0af873d1c4a38eb4b37e4498582c1af';

/// See also [_appInterceptors].
@ProviderFor(_appInterceptors)
final _appInterceptorsProvider = Provider<AppInterceptors>.internal(
  _appInterceptors,
  name: r'_appInterceptorsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appInterceptorsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _AppInterceptorsRef = ProviderRef<AppInterceptors>;
String _$logInterceptorHash() => r'9b6cd69cec7114370d1c2c40473b07ba384ff9a4';

/// See also [_logInterceptor].
@ProviderFor(_logInterceptor)
final _logInterceptorProvider = Provider<LogInterceptor>.internal(
  _logInterceptor,
  name: r'_logInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logInterceptorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _LogInterceptorRef = ProviderRef<LogInterceptor>;
String _$connectionCheckerHash() => r'bdc001e0076ee9bb5ecebecb18392514f794305d';

/// See also [_connectionChecker].
@ProviderFor(_connectionChecker)
final _connectionCheckerProvider = Provider<InternetConnectionChecker>.internal(
  _connectionChecker,
  name: r'_connectionCheckerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectionCheckerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _ConnectionCheckerRef = ProviderRef<InternetConnectionChecker>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
