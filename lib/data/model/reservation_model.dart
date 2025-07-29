import 'dart:convert';

class ReservationModel {
  int id;
  int userId;
  int diningTableId;
  DateTime date;
  String starttime;
  String endtime;
  int guestsCount;
  String notes;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  ReservationModel({
    required this.id,
    required this.userId,
    required this.diningTableId,
    required this.date,
    required this.starttime,
    required this.endtime,
    required this.guestsCount,
    required this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
    id: json["id"],
    userId: json["user_id"],
    diningTableId: json["dining_table_id"],
    date: DateTime.parse(json["date"]),
    starttime: json["starttime"],
    endtime: json["endtime"],
    guestsCount: json["guests_count"],
    notes: json["notes"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "dining_table_id": diningTableId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "starttime": starttime,
    "endtime": endtime,
    "guests_count": guestsCount,
    "notes": notes,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  ReservationModel reservationModelFromJson(String str) => ReservationModel.fromJson(json.decode(str));

  String reservationModelToJson(ReservationModel data) => json.encode(data.toJson());
}