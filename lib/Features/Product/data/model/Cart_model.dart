class CartItemModel {
  final int productId;
  final String name;
  final int quantity;
  final int totalPrice;
  final String? note;

  final String total;
  CartItemModel({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.totalPrice,
    this.note,

    required this.total,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) { //i change each one iteam  from in map from   json to object of model in  thos    "note": "لا اريد فواكه" in there map {} 




    return CartItemModel(
      productId: json['product_id'],
      name: json['name'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
      note: json['note'],
    
      total: json['total'], 
    );
  }
}




class CartResponseModel { 
  final List<CartItemModel> cartItems; //all the product in cart list 
  final int total; 

  CartResponseModel({
    required this.cartItems,
    required this.total,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    var items = (json['cart'] as List)
        .map((item) => CartItemModel.fromJson(item))
        .toList();  //i translate all the item from  json to list of  object model

    return CartResponseModel(
      cartItems: items,
      total: json['total'],
    );
  }
}


 