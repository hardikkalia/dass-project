import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cart_genie/features/search/screens/search_screen.dart';
import 'package:cart_genie/features/search/widgets/options.dart';
class SearchApiService {
  static const String baseUrl = 'https://your-api-url.com/api';

  Future<void> sendSearchRequest(List<Options> selectedOptions) async {
    final url = Uri.parse('$baseUrl/search');

    try {
      final response = await http.post(
        url,
        // body: jsonEncode(selectedOptions.map((option) => option.toJson()).toList()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Request successful
        print('Search request successful!');
        print('Response: ${response.body}');
      } else {
        // Request failed
        print('Failed to send search request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or server errors
      print('Error sending search request: $e');
    }
  }
}
