part of 'quote_cubit.dart';

@immutable
abstract class QuoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CubitInitState extends QuoteState {}

class QuoteLoadingState extends CubitInitState {}

class QuoteSuccessState extends CubitInitState {
  final Quote quote;

  QuoteSuccessState({required this.quote});

  @override
  List<Object?> get props => [quote];
}

class QuoteFailureState extends CubitInitState {
  final String msg;

  QuoteFailureState({required this.msg});

  @override
  List<Object?> get props => [msg];
}
