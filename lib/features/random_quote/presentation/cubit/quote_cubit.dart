import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecases.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/widgets/error_widget.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quote/presentation/widgets/quote_screen_body.dart';
part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  late Widget body;
  QuoteCubit({required this.getRandomQuoteUseCase}) : super(CubitInitState());

  static QuoteCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getRandomQuote() async {
    emit(QuoteLoadingState());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(
      response.fold(
        (failure) {
          body = MyErrorWidget(msg: _mapFailureToMsg(failure));
          return QuoteFailureState();
        },
        (quote) {
          body = QuoteScreenBody(quote: quote);
          return QuoteSuccessState();
        },
      ),
    );
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
