import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '../bloc/currency_converter_bloc.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<CurrencyConverterBloc, CurrencyConverterState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  child: const Text(
                    'Convert currencies in real-time',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                FadeInLeft(
                  child: TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: FadeInLeft(
                        delay: const Duration(milliseconds: 100),
                        child: DropdownButtonFormField<String>(
                          value: state.fromCurrency,
                          items: state.currencyList.map((currency) {
                            return DropdownMenuItem(
                              value: currency,
                              child: Text(currency.toUpperCase()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              context.read<CurrencyConverterBloc>().add(
                                FetchData(
                                  from: val,
                                  to: state.toCurrency,
                                  amount: state.amount,
                                ),
                              );
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'From',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FadeInRight(
                        delay: const Duration(milliseconds: 200),
                        child: DropdownButtonFormField<String>(
                          value: state.toCurrency,
                          items: state.currencyList.map((currency) {
                            return DropdownMenuItem(
                              value: currency,
                              child: Text(currency.toUpperCase()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              context.read<CurrencyConverterBloc>().add(
                                FetchData(
                                  from: state.fromCurrency,
                                  to: val,
                                  amount: state.amount,
                                ),
                              );
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'To',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: FadeInUp(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final amount = double.tryParse(_amountController.text);
                        if (amount != null) {
                          context.read<CurrencyConverterBloc>().add(
                            FetchData(
                              from: state.fromCurrency,
                              to: state.toCurrency,
                              amount: amount,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.swap_horiz),
                      label: const Text('Convert'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (state.isLoading) ...[
                  const Center(child: CircularProgressIndicator()),
                ] else if (state.error != null) ...[
                  Text('❌ ${state.error}', style: const TextStyle(color: Colors.red)),
                ] else if (state.result != null) ...[
                  Text(
                    '💱 ${state.amount} ${state.fromCurrency} = ${state.result!.toStringAsFixed(2)} ${state.toCurrency}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
