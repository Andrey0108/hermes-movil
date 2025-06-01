import 'package:hermes/interceptors/index.dart';
import 'package:hermes/models/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

final httpClient = HttpInterceptor(http.Client());

Future<List<ProgrammingModel>> getAllByResponsible(int idResponsible) async {
  final url = Uri.parse('$baseUrl/dates/responsible/$idResponsible');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200) {
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
