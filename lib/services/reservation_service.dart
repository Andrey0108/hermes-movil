import 'package:http/http.dart' as http;
import '../config.dart';

Future<http.Response> getAllReservations() async {
  final url = Uri.parse('$baseUrl/reservations/');
  final headers = {'Content-Type': 'application/json'};

  try {
    return await http.get(url, headers: headers);
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}
