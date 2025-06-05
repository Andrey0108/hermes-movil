import 'package:hermes/models/index.dart';

enum ReservationStatus { N, C, P, M, R, E, F }

class ReservationModel {
  final int id;
  final int idDate;
  final int idUser;
  final int price;
  final ReservationStatus status;
  final List<ReservationTravelerModel> detailReservationTravelers;

  ReservationModel({
    required this.id,
    required this.idDate,
    required this.idUser,
    required this.price,
    required this.status,
    required this.detailReservationTravelers,
  }) : assert(id >= 0, 'id must be non-negative'),
       assert(idDate >= 0, 'idDate must be non-negative'),
       assert(idUser >= 0, 'idUser must be non-negative'),
       assert(price >= 0, 'price must be non-negative'),
       assert(
         detailReservationTravelers.isNotEmpty,
         'detailReservationTravelers cannot be empty',
       );

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'] as int? ?? 0,
      idDate: json['idDate'] as int? ?? 0,
      idUser: json['idUser'] as int? ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      status: ReservationStatus.values.firstWhere(
        (e) => e.toString() == 'ReservationStatus.${json['status']}',
        orElse: () => ReservationStatus.N,
      ),
      detailReservationTravelers:
          (json['detailReservationTravelers'] as List<dynamic>?)
              ?.map(
                (e) => ReservationTravelerModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }
}
