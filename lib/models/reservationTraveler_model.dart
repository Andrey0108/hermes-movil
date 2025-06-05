class ReservationTravelerModel {
  int idTraveler;

  ReservationTravelerModel({this.idTraveler = 0})
    : assert(idTraveler >= 0, 'idTraveler must be non-negative');

  factory ReservationTravelerModel.fromJson(Map<String, dynamic> json) {
    return ReservationTravelerModel(
      idTraveler: json['idTraveler'] as int? ?? 0,
    );
  }
}
