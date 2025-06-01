import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpInterceptor extends http.BaseClient {
  final http.Client _inner;

  HttpInterceptor(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    } else {
      throw Exception(
        'Token JWT no encontrado. Por favor, inicia sesión nuevamente.',
      );
    }

    final response = await _inner.send(request);

    if (response.statusCode == 401) {
      throw Exception(
        'Token no válido o expirado. Por favor, inicia sesión nuevamente.',
      );
    }

    return response;
  }
}
