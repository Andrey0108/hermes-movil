import 'package:http/http.dart' as http;
import '../config.dart';

Future<http.Response> getAllPackages() async {
  final url = Uri.parse('$baseUrl/packages/');
  final headers = {'Content-Type': 'application/json'};

  try {
    return await http.get(url, headers: headers);
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}
