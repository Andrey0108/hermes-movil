class ProgrammingModel {
  int id;
  int idPackage;
  int amount;
  DateTime start;
  DateTime end;
  DateTime startRegistration;
  DateTime endRegistration;
  bool status;

  ProgrammingModel({
    this.id = 0,
    this.idPackage = 0,
    this.amount = 0,
    DateTime? start,
    DateTime? end,
    DateTime? startRegistration,
    DateTime? endRegistration,
    this.status = true,
  }) : start = start ?? DateTime.now(),
       end = end ?? DateTime.now(),
       startRegistration = startRegistration ?? DateTime.now(),
       endRegistration = endRegistration ?? DateTime.now();

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
