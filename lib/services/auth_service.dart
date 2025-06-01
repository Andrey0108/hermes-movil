import 'package:hermes/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

final _isAuthenticatedController = StreamController<bool>.broadcast();
final _currentUserController =
    StreamController<Map<String, dynamic>?>.broadcast();

Stream<bool> get isAuthenticated$ => _isAuthenticatedController.stream;
Stream<Map<String, dynamic>?> get currentUser$ => _currentUserController.stream;

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

      await _setTokens(token);
      _updateCurrentUser(token);
      _isAuthenticatedController.add(true);
    }
    return response;
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}

Future<void> _setTokens(String accessToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwt_token', accessToken);
}

Future<String?> _getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('jwt_token');
}

Future<void> _updateCurrentUser(String token) async {
  final decodedToken = _getDecodedAccessToken(token);
  if (decodedToken != null) {
    final requiredFields = ['name', 'surName', 'email', 'phone', 'address'];
    final missingFields = requiredFields
        .where((field) => !decodedToken.containsKey(field))
        .toList();

    if (missingFields.isEmpty) {
      _currentUserController.add(decodedToken);
    } else {
      throw Exception(
        'Decoded token is missing required fields: $missingFields',
      );
    }
  } else {
    throw Exception('Failed to decode token');
  }
}

Future<Map<String, dynamic>?> getCurrentUser() async {
  final token = await _getAccessToken();
  if (token == null || await isTokenExpired(token)) {
    throw Exception('Usuario no autenticado o token expirado');
  }

  final decodedToken = _getDecodedAccessToken(token);
  if (decodedToken != null) {
    return decodedToken;
  } else {
    throw Exception('Error al obtener el usuario');
  }
}

Map<String, dynamic>? _getDecodedAccessToken(String token) {
  try {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token format');
    }
    String payloadBase64 = parts[1];
    while (payloadBase64.length % 4 != 0) {
      payloadBase64 += '=';
    }
    final payload = utf8.decode(base64Url.decode(payloadBase64));
    return jsonDecode(payload);
  } catch (e) {
    throw Exception('Error decoding token: $e');
  }
}

Future<bool> isTokenExpired(String? token) async {
  if (token == null || token.isEmpty) return true;

  try {
    final decodedToken = _getDecodedAccessToken(token);
    if (decodedToken == null || !decodedToken.containsKey('exp')) return true;

    final exp = decodedToken['exp'];
    return exp < DateTime.now().millisecondsSinceEpoch / 1000;
  } catch (e) {
    return true;
  }
}

Future<bool> hasToken() async {
  final token = await _getAccessToken();
  return token != null && token.isNotEmpty;
}

Future<bool> logout() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    _isAuthenticatedController.add(false);
    _currentUserController.add(null);
    return true;
  } catch (e) {
    throw Exception('Error during logout: $e');
  }
}
