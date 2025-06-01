import 'package:hermes/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response> login(String email, String password) async {
  final url = Uri.parse('$baseUrl/auth/log-in');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);

      final token = responseData['accessToken'];

      if (token == null || token.isEmpty) {
        throw Exception(
          'El token no está presente o está vacío en la respuesta',
        );
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
    }
    return response;
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}

Future<http.Response> logout() async {
  final url = Uri.parse('$baseUrl/auth/log-out');
  final headers = {'Content-Type': 'application/json'};

  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token == null || token.isEmpty) {
      throw Exception('No JWT token found in shared preferences');
    }

    headers['Authorization'] = 'Bearer $token';

    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await prefs.remove('jwt_token');
    }
    return response;
  } catch (e) {
    throw Exception('Error during logout: $e');
  }
}
