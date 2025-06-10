import 'package:hermes/interceptors/index.dart';
import 'package:hermes/models/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

final httpClient = HttpInterceptor(http.Client());

Future<List<PackageModel>> getAllPackages() async {
  final url = Uri.parse('$baseUrl/packages/');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      List<PackageModel> packages = data
          .map((item) => PackageModel.fromJson(item))
          .toList();
      return packages;
    } else {
      throw Exception('Failed to load packages');
    }
  } catch (e) {
    throw Exception('Error during fetching packages: $e');
  }
}
