import 'package:hermes/models/index.dart';
import 'package:hermes/services/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config.dart';

Future<UserModel> getProfile() async {
  final currentUser = await getCurrentUser();
  final userId = currentUser?['id'];

  if (userId == null) {
    throw Exception('Usuario no autenticado');
  }

  final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

  if (response.statusCode == 200) {
    return UserModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error al obtener el usuario');
  }
}
