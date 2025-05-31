import 'package:http/http.dart' as http;
import '../config.dart'; // Importa el archivo de configuración

Future<http.Response> login(int idResponsible, String token) async {
  final url = Uri.parse(
    '$baseUrl/dates/responsible/$idResponsible',
  ); // Usa la URL base
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  try {
    return await http.post(url, headers: headers);
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}
