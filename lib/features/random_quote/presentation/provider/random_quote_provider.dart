import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../injection_providers/providers.dart';
import '../../domain/entities/quote.dart';

part 'random_quote_provider.g.dart';


@riverpod
class RandomQuote extends _$RandomQuote {
  @override
  Future<Quote> build() async {
    state = const AsyncLoading();
    return await ref.read(randomQuoteUsecaseProvider.future);
  }
}
