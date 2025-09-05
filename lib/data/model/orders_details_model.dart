// To parse this JSON data, do
//
//     final ordersDetails = ordersDetailsFromJson(jsonString);

import 'dart:convert';

OrdersDetails ordersDetailsFromJson(String str) => OrdersDetails.fromJson(json.decode(str));

String ordersDetailsToJson(OrdersDetails data) => json.encode(data.toJson());

class OrdersDetails {
  Order order;

  OrdersDetails({
    required this.order,
  });

  factory OrdersDetails.fromJson(Map<String, dynamic> json) => OrdersDetails(
    order: Order.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
  };
}

class Order {
  int orderId;
  String totalPrice;
  User user;
  Address address;
  List<Product> products;

  Order({
    required this.orderId,
    required this.totalPrice,
    required this.user,
    required this.address,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    totalPrice: json["total_price"],
    user: User.fromJson(json["user"]),
    address: Address.fromJson(json["address"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "total_price": totalPrice,
    "user": user.toJson(),
    "address": address.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Address {
  String city;
  String street;
  int building;
  int floor;
  String notes;

  Address({
    required this.city,
    required this.street,
    required this.building,
    required this.floor,
    required this.notes,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    street: json["street"],
    building: json["building"],
    floor: json["floor"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "street": street,
    "building": building,
    "floor": floor,
    "notes": notes,
  };
}

class Product {
  String name;
  int quantity;

  Product({
    required this.name,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
  };
}

class User {
  String username;
  String mobile;

  User({
    required this.username,
    required this.mobile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "mobile": mobile,
  };
}
