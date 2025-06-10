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

Future<List<ReservationModel>> getTravelersByProgramming(int idDate) async {
  final url = Uri.parse('$baseUrl/reservations/travelers/$idDate');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      if (data.isEmpty) {
        return []; // Retornar lista vacía si no hay datos
      }
      List<ReservationModel> reservations = data
          .map((item) => ReservationModel.fromJson(item))
          .toList();
      return reservations;
    } else {
      throw Exception('Failed to load travelers');
    }
  } catch (e) {
    return []; // Retornar lista vacía en caso de error
  }
}

// Add a helper function to get user info by ID
UserModel getInfoUser(int idUser, List<UserModel> travelers) {
  return travelers.firstWhere(
    (traveler) => traveler.id == idUser,
    orElse: () => UserModel(
      id: 0,
      idRole: 0,
      typeDocument: '',
      document: '',
      name: '',
      surName: '',
      dateBirth: DateTime.now(),
      email: '',
      idMunicipality: 0,
      phone: '',
      status: false,
      activate: false,
    ),
  );
}
