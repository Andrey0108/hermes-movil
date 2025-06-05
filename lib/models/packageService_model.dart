class PackageServiceModel {
  int id;
  int idPackage;
  int idService;
  int quantity;
  num price;
  bool status;

  PackageServiceModel({
    required this.id,
    required this.idPackage,
    required this.idService,
    required this.quantity,
    required this.price,
    required this.status,
  }) : assert(id > 0, 'id must be greater than zero'),
       assert(quantity >= 0, 'quantity cannot be negative'),
       assert(price >= 0, 'price cannot be negative'),
       assert(idPackage > 0, 'idPackage must be greater than zero'),
       assert(idService > 0, 'idService must be greater than zero'),
       assert(quantity > 0, 'quantity must be greater than zero');

  factory PackageServiceModel.fromJson(Map<String, dynamic> json) {
    return PackageServiceModel(
      id: json['id'] as int,
      idPackage: json['idPackage'] as int,
      idService: json['idService'] as int,
      quantity: json['quantity'] as int,
      price: json['price'] is String
          ? num.parse(json['price']) // Parse String to num
          : json['price'],
      status: json['status'] as bool,
    );
  }
}
