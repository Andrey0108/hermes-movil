import 'package:hermes/models/index.dart';

class Package {
  final int id;
  final String name;
  final int idActivity;
  final int idMunicipality;
  final int level;
  final int price;
  final int reserve;
  final String description;
  final String image;
  final bool status;
  final List<PackageServiceModel> detailPackagesServices;

  Package({
    required this.id,
    required this.name,
    required this.idActivity,
    required this.idMunicipality,
    required this.level,
    required this.price,
    required this.reserve,
    required this.description,
    required this.image,
    required this.status,
    required this.detailPackagesServices,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      idActivity: json['idActivity'] ?? 0,
      idMunicipality: json['idMunicipality'] ?? 0,
      level: json['level'] ?? 0,
      price: json['price'] ?? 0,
      reserve: json['reserve'] ?? 0,
      description: json['description'] ?? "",
      image: json['image'] ?? "",
      status: json['status'] ?? true,
      detailPackagesServices:
          (json['detailPackagesServices'] as List<dynamic>? ?? [])
              .map((item) => PackageServiceModel.fromJson(item))
              .toList(),
    );
  }
}
