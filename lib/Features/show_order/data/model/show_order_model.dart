// show_order_model.dart  (مختصر)
class OrderModel {
  final int id;
  final int userId;
  final int addressId;
  final int? reservationId;
  final String orderType;
  final String status;
  final String totalPriceRaw;
  double get totalPrice => double.tryParse(totalPriceRaw) ?? 0.0;
  final String? reservationTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<OrderProduct> products;
  final OrderAddress address;

  OrderModel({
    required this.id,
    required this.userId,
    required this.addressId,
    this.reservationId,
    required this.orderType,
    required this.status,
    required this.totalPriceRaw,
    this.reservationTime,
    this.createdAt,
    this.updatedAt,
    required this.products,
    required this.address,
  });

  factory OrderModel.fromJson(Map<String, dynamic> j) => OrderModel(
        id: j['id'] as int,
        userId: j['user_id'] as int,
        addressId: j['address_id'] as int,
        reservationId: j['reservation_id'] as int?,
        orderType: j['order_type']?.toString() ?? '',
        status: j['status']?.toString() ?? '',
        totalPriceRaw: j['total_price']?.toString() ?? '0',
        reservationTime: j['reservation_time'] as String?,
        createdAt: _parseDate(j['created_at']),
        updatedAt: _parseDate(j['updated_at']),
        products: (j['products'] as List? ?? [])
            .map((e) => OrderProduct.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        address: OrderAddress.fromJson(
            Map<String, dynamic>.from(j['address'] ?? {})),
      );
}

class OrderProduct {
  final int id;
  final int categoryId;
  final String image;
  final String name;
  final String priceRaw;
  double get price => double.tryParse(priceRaw) ?? 0.0;
  final String? details;
  final Pivot pivot;

  OrderProduct({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.name,
    required this.priceRaw,
    this.details,
    required this.pivot,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> j) => OrderProduct(
        id: j['id'] as int,
        categoryId: j['category_id'] as int,
        image: j['image']?.toString() ?? '',
        name: j['name']?.toString() ?? '',
        priceRaw: j['price']?.toString() ?? '0',
        details: j['details'] as String?,
        pivot: Pivot.fromJson(Map<String, dynamic>.from(j['pivot'] ?? {})),
      );
}

class Pivot {
  final int orderId;
  final int productId;
  final int quantity;
  final String totalPriceRaw;
  double get totalPrice => double.tryParse(totalPriceRaw) ?? 0.0;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Pivot({
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.totalPriceRaw,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> j) => Pivot(
        orderId: j['order_id'] as int? ?? 0,
        productId: j['product_id'] as int? ?? 0,
        quantity: j['quantity'] as int? ?? 0,
        totalPriceRaw: j['total_price']?.toString() ?? '0',
        createdAt: _parseDate(j['created_at']),
        updatedAt: _parseDate(j['updated_at']),
      );
}

class OrderAddress {
  final int id;
  final int userId;
  final String? city;
  final String? street;
  final int? building;
  final int? floor; // من "Floor"
  final String? notes;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderAddress({
    required this.id,
    required this.userId,
    this.city,
    this.street,
    this.building,
    this.floor,
    this.notes,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderAddress.fromJson(Map<String, dynamic> j) => OrderAddress(
        id: j['id'] as int? ?? 0,
        userId: j['user_id'] as int? ?? 0,
        city: j['city'] as String?,
        street: j['street'] as String?,
        building: _toIntNullable(j['building']),
        floor: _toIntNullable(j['Floor']),
        notes: j['notes'] as String?,
        latitude: j['latitude']?.toString(),
        longitude: j['longitude']?.toString(),
        createdAt: _parseDate(j['created_at']),
        updatedAt: _parseDate(j['updated_at']),
      );
}

/// Helpers
DateTime? _parseDate(dynamic v) {
  if (v == null) return null;
  try {
    return DateTime.parse(v.toString());
  } catch (_) {
    return null;
  }
}

int? _toIntNullable(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  return int.tryParse(v.toString());
}
