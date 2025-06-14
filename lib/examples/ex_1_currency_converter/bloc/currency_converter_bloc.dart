
import 'package:flutter_bloc_examples/constants/api_url.dart';
import 'package:http/http.dart' as http;
import '../../../constants/screen_path.dart';
part 'currency_converter_event.dart';
part 'currency_converter_state.dart';



class CurrencyConverterBloc extends Bloc<CurrencyConverterEvent, CurrencyConverterState> {
  CurrencyConverterBloc() : super(const CurrencyConverterState()) {
    on<FetchData>(_onFetchData);
    on<LoadCurrencies>(_onLoadCurrencies);
  }

  Future<void> _onFetchData(FetchData event, Emitter<CurrencyConverterState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final url = Uri.parse(
        'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/${event.from.toLowerCase()}.json',
      );

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final rates = jsonData[event.from.toLowerCase()] as Map<String, dynamic>;
        final conversionRate = (rates[event.to.toLowerCase()] as num).toDouble();

        final converted = event.amount * conversionRate;

        emit(state.copyWith(
          isLoading: false,
          result: converted,
          fromCurrency: event.from,
          toCurrency: event.to,
          amount: event.amount,
        ));
      } else {
        emit(state.copyWith(isLoading: false, error: 'Failed to fetch data.'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onLoadCurrencies(LoadCurrencies event, Emitter<CurrencyConverterState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final url = Uri.parse(ApiUrl.fullUrl);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final currencies = data.keys.map((e) => e.toUpperCase()).toList()..sort();

        emit(state.copyWith(isLoading: false, currencyList: currencies));
      } else {
        emit(state.copyWith(isLoading: false, error: 'Failed to load currencies.'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}