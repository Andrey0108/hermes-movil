import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // Importar para almacenamiento local

Future<http.Response> login(String email, String password) async {
  final url = Uri.parse('http://localhost:3000/auth/log-in');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData);
      final token = responseData['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
    }
    return response;
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}
