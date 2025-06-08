import 'package:equatable/equatable.dart';

import '../../../constants/screen_path.dart';
part 'currency_converter_event.dart';
part 'currency_converter_state.dart';

class CurrencyConverterBloc extends Bloc<CurrencyConverterEvent, CurrencyConverterState> {
  CurrencyConverterBloc() : super(CurrencyConverterInitial()) {
    on<CurrencyConverterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
