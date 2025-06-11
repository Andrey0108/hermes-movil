import 'dart:convert';

import 'package:hermes/config.dart';
import 'package:hermes/interceptors/index.dart';
import 'package:hermes/models/index.dart';
import 'package:http/http.dart' as http;

final httpClient = HttpInterceptor(http.Client());

Future<List<UserModel>> getAllClients() async {
  final url = Uri.parse('$baseUrl/users/clients');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      List<UserModel> clients = data
          .map((client) => UserModel.fromJson(client))
          .toList();
      return clients;
    } else {
      throw Exception('Failed to load clients');
    }
  } catch (e) {
    throw Exception('Error during fetching clients: $e');
  }
}
