part of 'currency_converter_bloc.dart';


// Bloc State


class CurrencyConverterState extends Equatable {
  final bool isLoading;
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  final double? result;
  final String? error;

  const CurrencyConverterState({
    this.isLoading = false,
    this.fromCurrency = 'USD',
    this.toCurrency = 'PKR',
    this.amount = 0.0,
    this.result,
    this.error,
  });

  CurrencyConverterState copyWith({
    bool? isLoading,
    String? fromCurrency,
    String? toCurrency,
    double? amount,
    double? result,
    String? error,
  }) {
    return CurrencyConverterState(
      isLoading: isLoading ?? this.isLoading,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      amount: amount ?? this.amount,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, fromCurrency, toCurrency, amount, result, error];
}
