part of 'quote_cubit.dart';

@immutable
abstract class QuoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CubitInitState extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteSuccessState extends QuoteState {}

class QuoteFailureState extends QuoteState {}
