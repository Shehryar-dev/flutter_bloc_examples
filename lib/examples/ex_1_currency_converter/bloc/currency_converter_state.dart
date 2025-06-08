part of 'currency_converter_bloc.dart';


// Bloc State
class CurrencyConverterState extends Equatable {
  final bool isLoading;
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  final double? result;
  final String? error;
  final List<String> currencyList;

  const CurrencyConverterState({
    this.isLoading = false,
    this.fromCurrency = 'USD',
    this.toCurrency = 'PKR',
    this.amount = 0.0,
    this.result,
    this.error,
    this.currencyList = const [],
  });

  CurrencyConverterState copyWith({
    bool? isLoading,
    String? fromCurrency,
    String? toCurrency,
    double? amount,
    double? result,
    String? error,
    List<String>? currencyList,
  }) {
    return CurrencyConverterState(
      isLoading: isLoading ?? this.isLoading,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      amount: amount ?? this.amount,
      result: result ?? this.result,
      error: error ?? this.error,
      currencyList: currencyList ?? this.currencyList,
    );
  }

  @override
  List<Object?> get props => [isLoading, fromCurrency, toCurrency, amount, result, error, currencyList];
}

