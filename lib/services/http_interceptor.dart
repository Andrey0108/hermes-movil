import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpInterceptor extends http.BaseClient {
  final http.Client _inner;

  HttpInterceptor(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token'; // Adjuntar el token
    }

    return _inner.send(request);
  }
}
