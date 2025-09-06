class CartItemModel {
  final int productId;
  final String name;
    final String image;
  final int quantity;
  final int totalPrice;
  final String? note;


  CartItemModel({
    required this.productId,
    required this.name,
        required this.image,
    required this.quantity,
    required this.totalPrice,
    this.note,


  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) { //i change each one iteam  from  map   json to object of model in  thos    "note": "لا اريد فواكه" in there map {} 




    return CartItemModel(
      productId: json['product_id'],
      name: json['name'],
        image: json['image'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
      note: json['note'],
    

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


 