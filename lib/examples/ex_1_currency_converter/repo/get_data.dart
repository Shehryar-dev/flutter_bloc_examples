import 'dart:convert';
import 'package:flutter_bloc_examples/constants/api_url.dart';
import 'package:http/http.dart' as http;


class GetData {
  Future<double?> fetchConversionRate(String from, String to) async {
    try {
      final url = Uri.parse('${ApiUrl.baseUrl}/${from.toLowerCase()}.json');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rate = (data[from.toLowerCase()][to.toLowerCase()] as num).toDouble();
        return rate;
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
