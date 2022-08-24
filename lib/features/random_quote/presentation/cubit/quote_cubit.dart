import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecases.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  QuoteCubit({required this.getRandomQuoteUseCase}) : super(CubitInitState());

  Future<void> getRandomQuote() async {
    emit(QuoteLoadingState());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(response.fold(
        (failure) => QuoteFailureState(msg: _mapFailureToMsg(failure)),
        (quote) => QuoteSuccessState(quote: quote)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedFailure;
    }
  }
}
