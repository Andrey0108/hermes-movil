import 'package:http/http.dart' as http;

Future<http.Response> login(int idResponsible, String token) async {
  final url = Uri.parse(
    'http://localhost:3000/datesresponsible/$idResponsible',
  );
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  try {
    return await http.post(url, headers: headers);
  } catch (e) {
    print(e);
    rethrow;
  }
}
