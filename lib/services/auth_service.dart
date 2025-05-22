import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> login(String email, String password) async {
  final url = Uri.parse('http://localhost:3000/auth/log-in');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});

  try {
    final response = await http.post(url, headers: headers, body: body);
    return response; // Return the response object
  } catch (e) {
    // Handle errors as needed, maybe re-throw or return a specific error response
    print('Error al conectar con la API: $e');
    rethrow; // Re-throw the exception to be handled by the caller
  }
}
