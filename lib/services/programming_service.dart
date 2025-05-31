import 'package:http/http.dart' as http;
import '../config.dart'; // Importa el archivo de configuración

Future<http.Response> getAllByResponsible(int idResponsible) async {
  final url = Uri.parse('$baseUrl/dates/responsible/$idResponsible');
  final headers = {'Content-Type': 'application/json'};

  try {
    return await http.get(url, headers: headers);
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}
