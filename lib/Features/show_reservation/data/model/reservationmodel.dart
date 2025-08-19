class ReservationModel {
  final int id;
  final int userId;
  final int diningTableId;
  final DateTime date;
  final String starttime;
  final String endtime;
  final int guestsCount;
  final String notes;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

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

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      userId: json['user_id'],
      diningTableId: json['dining_table_id'],
      date: DateTime.parse(json['date']),
      starttime: json['starttime'],
      endtime: json['endtime'],
      guestsCount: json['guests_count'],
      notes: json['notes'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }


}
