import 'package:hermes/models/index.dart';

class PackageModel {
  int id;
  String name;
  int idActivity;
  int idMunicipality;
  int? level;
  double price;
  int reserve;
  String description;
  String image;
  bool status;
  List<PackageServiceModel> detailPackagesServices;

  PackageModel({
    required this.id,
    required this.name,
    required this.idActivity,
    required this.idMunicipality,
    required this.level,
    required this.price,
    required this.reserve,
    required this.description,
    this.image = '', // Provide a default value
    required this.detailPackagesServices,
    required this.status,
  }) : assert(
         image.isNotEmpty,
         'image cannot be empty',
       ); // Ensure non-empty image

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] as int,
      name: json['name'] as String,
      idActivity: json['idActivity'] as int,
      idMunicipality: json['idMunicipality'] as int,
      level: json['level'] is String ? int.parse(json['level']) : json['level'],
      price: json['price'] is String
          ? double.parse(json['price'])
          : json['price'],
      reserve: json['reserve'] is String
          ? double.parse(json['reserve'])
          : json['reserve'],
      description: json['description'] as String,
      image: json['image'] ?? '', // Fallback to empty string
      detailPackagesServices: (json['detailPackagesServices'] as List<dynamic>)
          .map((e) => PackageServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
    );
  }
}
