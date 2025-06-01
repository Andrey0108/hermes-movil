import 'package:hermes/interceptors/index.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/services/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

final httpClient = HttpInterceptor(http.Client());

Future<UserModel> getProfile() async {
  final currentUser = await getCurrentUser();
  final userId = currentUser?['id'];

  if (userId == null) {
    throw Exception('Usuario no autenticado');
  }

  final response = await httpClient.get(Uri.parse('$baseUrl/users/$userId'));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    return UserModel(
      id: responseData['id'],
      idRole: responseData['idRole'],
      typeDocument: responseData['typeDocument'],
      document: responseData['document'],
      name: responseData['name'],
      surName: responseData['surName'],
      dateBirth: DateTime.parse(responseData['dateBirth']),
      email: responseData['email'],
      idMunicipality: responseData['idMunicipality'],
      address: responseData['address'],
      phone: responseData['phone'],
      emergency: responseData['emergency'],
      sex: responseData['sex'],
      bloodType: responseData['bloodType'],
      eps: responseData['eps'],
      status: responseData['status'],
      activate: responseData['activate'],
      activationToken: responseData['activationToken'],
      resetPasswordToken: responseData['resetPasswordToken'],
      passwordUpdatedAt: DateTime.parse(responseData['passwordUpdatedAt']),
    );
  } else {
    throw Exception('Error al obtener el usuario');
  }
}
