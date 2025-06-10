import 'package:hermes/interceptors/index.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/services/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

final httpClient = HttpInterceptor(http.Client());

Future<List<ProgrammingModel>> getAllByResponsible([int? userId]) async {
  final currentUser = await getCurrentUser();
  int id = currentUser?['id'] ?? currentUser?['id'] ?? 0;

  final url = Uri.parse("$baseUrl/dates/responsible/$id");
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProgrammingModel> programmingList = data
          .map((item) => ProgrammingModel.fromJson(item))
          .toList();
      return programmingList;
    } else {
      throw Exception('Failed to load programming data');
    }
  } catch (e) {
    throw Exception('Error during fetching programming data: $e');
  }
}
