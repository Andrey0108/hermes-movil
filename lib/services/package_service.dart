import 'package:hermes/models/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

Future<List<Package>> getAllPackages() async {
  final url = Uri.parse('$baseUrl/packages/');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Package> packages = data
          .map((item) => Package.fromJson(item))
          .toList();
      return packages;
    } else {
      throw Exception('Failed to load packages');
    }
  } catch (e) {
    throw Exception('Error during fetching packages: $e');
  }
}
