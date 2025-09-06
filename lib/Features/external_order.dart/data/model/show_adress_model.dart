// lib/Features/external_order.dart/data/model/show_adress_model.dart

class AddressModel {
  final int id;
  final String city;
  final String street;
  final int building;
  final int floor;
  final String? notes;
  final double? latitude;
  final double? longitude;

  AddressModel({
    required this.id,
    required this.city,
    required this.street,
    required this.building,
    required this.floor,
    this.notes,
    this.latitude,
    this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> j) {
    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse(v.toString()) ?? 0;
    }

    double? _toDouble(dynamic v) {
      if (v == null) return null;
      if (v is num) return v.toDouble();
      return double.tryParse(v.toString());
    }

    String _toStr(dynamic v) => (v ?? '').toString();

    return AddressModel(
      id: _toInt(j['id']),
      city: _toStr(j['city']),
      street: _toStr(j['street']),
      building: _toInt(j['building']),
      floor: _toInt(j['floor'] ?? j['Floor']), // 👈 يدعم Floor أو floor
      notes: j['notes']?.toString(),
      latitude: _toDouble(j['latitude']),
      longitude: _toDouble(j['longitude']),
    );
  }
}
