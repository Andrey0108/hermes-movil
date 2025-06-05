import 'dart:convert';

import 'package:hermes/interceptors/index.dart';
import 'package:hermes/models/index.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

final httpClient = HttpInterceptor(http.Client());

Future<http.Response> getAllReservations() async {
  final url = Uri.parse('$baseUrl/reservations/');
  final headers = {'Content-Type': 'application/json'};

  try {
    return await httpClient.get(url, headers: headers);
  } catch (e) {
    throw Exception('Error during login: $e');
  }
}

Future<List<UserModel>> getTravelersByProgramming(int idDate) async {
  final url = Uri.parse('$baseUrl/reservations/travelers/$idDate');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => UserModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load travelers');
    }
  } catch (e) {
    throw Exception('Error fetching travelers: $e');
  }
}
