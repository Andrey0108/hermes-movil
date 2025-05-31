class ProgrammingModel {
  final int id;
  final int idPackage;
  final int amount;
  final DateTime start;
  final DateTime end;
  final DateTime startRegistration;
  final DateTime endRegistration;
  final bool status;

  ProgrammingModel({
    required this.id,
    required this.idPackage,
    required this.amount,
    required this.start,
    required this.end,
    required this.startRegistration,
    required this.endRegistration,
    required this.status,
  });

  factory ProgrammingModel.fromJson(Map<String, dynamic> json) {
    return ProgrammingModel(
      id: json['id'],
      idPackage: json['idPackage'],
      amount: json['amount'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      startRegistration: DateTime.parse(json['startRegistration']),
      endRegistration: DateTime.parse(json['endRegistration']),
      status: json['status'],
    );
  }
}
