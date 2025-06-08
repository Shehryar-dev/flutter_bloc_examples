
import 'package:http/http.dart' as http;
import '../../../constants/screen_path.dart';
part 'currency_converter_event.dart';
part 'currency_converter_state.dart';



class CurrencyConverterBloc extends Bloc<CurrencyConverterEvent, CurrencyConverterState> {
  CurrencyConverterBloc() : super(const CurrencyConverterState()) {
    on<FetchData>(_onFetchData);
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
}
