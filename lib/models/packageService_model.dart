class PackageServiceModel {
  final int idService;
  final int quantity;
  final int price;

  PackageServiceModel({
    required this.idService,
    required this.quantity,
    required this.price,
  });

  factory PackageServiceModel.fromJson(Map<String, dynamic> json) {
    return PackageServiceModel(
      idService: json['idService'] ?? 0,
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
    );
  }
}
