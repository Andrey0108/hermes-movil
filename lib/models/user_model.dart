class UserModel {
  final int id;
  final int idRole;
  final String typeDocument;
  final String document;
  final String name;
  final String surName;
  final DateTime dateBirth;
  final String email;
  final String password;
  final int idMunicipality;
  final String? address;
  final String phone;
  final String? emergency;
  final String? sex;
  final String? bloodType;
  final String? eps;
  final bool status;

  UserModel({
    required this.id,
    required this.idRole,
    required this.typeDocument,
    required this.document,
    required this.name,
    required this.surName,
    required this.dateBirth,
    required this.email,
    required this.password,
    required this.idMunicipality,
    this.address,
    required this.phone,
    this.emergency,
    this.sex,
    this.bloodType,
    this.eps,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      idRole: json['idRole'] as int,
      typeDocument: json['typeDocument'] as String,
      document: json['document'] as String,
      name: json['name'] as String,
      surName: json['surName'] as String,
      dateBirth: DateTime.parse(json['dateBirth'] as String),
      email: json['email'] as String,
      password: json['password'] as String,
      idMunicipality: json['idMunicipality'] as int,
      address: json['address'] as String?,
      phone: json['phone'] as String,
      emergency: json['emergency'] as String?,
      sex: json['sex'] as String?,
      bloodType: json['bloodType'] as String?,
      eps: json['eps'] as String?,
      status: json['status'] as bool,
    );
  }
}
