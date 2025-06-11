import 'dart:convert';

import 'package:hermes/interceptors/index.dart';
import 'package:hermes/models/index.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

final httpClient = HttpInterceptor(http.Client());

Future<List<ReservationModel>> getAllReservations() async {
  final url = Uri.parse('$baseUrl/reservations');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      if (data.isEmpty) {
        return [];
      }
      List<ReservationModel> reservations = data
          .map((item) => ReservationModel.fromJson(item))
          .toList();
      return reservations;
    } else {
      throw Exception('Failed to load reservations');
    }
  } catch (e) {
    return [];
  }
}

Future<List<ReservationModel>> getTravelers(int idDate) async {
  final url = Uri.parse('$baseUrl/reservations/travelers/$idDate');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      List<ReservationModel> reservations = data
          .map((item) => ReservationModel.fromJson(item))
          .toList();
      return reservations;
    } else {
      throw Exception('Failed to load travelers');
    }
  } catch (e) {
    throw Exception('Error al cargar los viajeros: $e');
  }
}
