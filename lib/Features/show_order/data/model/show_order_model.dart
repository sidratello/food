// show_order_model.dart  (نسخة آمنة)

class OrderModel {
  final int id;
  final int userId;
  final int addressId;
  final int? reservationId;
  final String orderType;
  final String status;

  /// API يُرسلها كسلسلة مثل "580000.00"
  final String totalPriceRaw;
  double get totalPrice => _toDouble(totalPriceRaw);

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
        id: _toInt(j['id']),
        userId: _toInt(j['user_id']),
        addressId: _toInt(j['address_id']),
        reservationId: _toIntNullable(j['reservation_id']),
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
          Map<String, dynamic>.from(j['address'] ?? {}),
        ),
      );
}

class OrderProduct {
  final int id;
  final int categoryId;
  final String image;
  final String name;

  /// API يُرسلها كسلسلة
  final String priceRaw;
  double get price => _toDouble(priceRaw);

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
        id: _toInt(j['id']),
        categoryId: _toInt(j['category_id']),
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

  /// API يُرسلها كسلسلة
  final String totalPriceRaw;
  double get totalPrice => _toDouble(totalPriceRaw);

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
        orderId: _toInt(j['order_id']),
        productId: _toInt(j['product_id']),
        quantity: _toInt(j['quantity']),
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
  final int? floor; // الحقل في الـ API اسمه "Floor" بحرف كبير
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
        id: _toInt(j['id']),
        userId: _toInt(j['user_id']),
        city: j['city'] as String?,
        street: j['street'] as String?,
        building: _toIntNullable(j['building']),
        floor: _toIntNullable(j['Floor']), // انتبه للحرف الكبير
        notes: j['notes'] as String?,
        latitude: j['latitude']?.toString(),
        longitude: j['longitude']?.toString(),
        createdAt: _parseDate(j['created_at']),
        updatedAt: _parseDate(j['updated_at']),
      );
}

/// -------------------------
/// Helpers آمنة للتحويلات
/// -------------------------
int _toInt(dynamic v, {int fallback = 0}) {
  if (v == null) return fallback;
  if (v is int) return v;
  if (v is double) return v.toInt();
  if (v is String) return int.tryParse(v) ?? fallback;
  return fallback;
}

int? _toIntNullable(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is double) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

double _toDouble(dynamic v, {double fallback = 0.0}) {
  if (v == null) return fallback;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? fallback;
  return fallback;
}

DateTime? _parseDate(dynamic v) {
  if (v == null) return null;
  try {
    return DateTime.parse(v.toString());
  } catch (_) {
    return null;
  }
}
