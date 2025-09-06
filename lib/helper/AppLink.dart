class Applink {
  static const String Server = 'http://192.168.1.3:8000/api';
  static const String imageBaseUrl = 'http://192.168.21.204:8000/';

  static const String choose = '$Server/chooseRole';
  static const String login = '$Server/login';
  static const String Signup = '$Server/register';
  static const String ForgetPassword = '$Server/forgotPa';
  static const String VaryFayScreen = '$Server/verify2/6';

  static String verifyCodeUrl(int userId) => '$Server/verify2/$userId';

  static String RePaswordUrl(int userId) => '$Server/reserpa/$userId';

  static String verifyCodeUrlFirst(int userId) => '$Server/verify/$userId';
  static const String AddToCart = '$Server/addtocart';
  static String Category = '$Server/category';

  static String productCategory(int categoryId) =>
      '$Server/product/$categoryId';

  static const String searchforproductandcategory = '$Server/Search1';

  static const String AddtoCart = '$Server/addtocart';
  static const String ShowCart = '$Server/showcart';

  static const String AddtoFavourite = '$Server/addtoFavourite';
  static const String ShowFavourit = '$Server/showFav';

  static String reservation() => '$Server/reserve';

  static String showreservation() => '$Server/showreserve';

  static String updateReservation(int id) => '$Server/update/$id';

  static String cancelReservation(int id) => '$Server/cancelReservation/$id';

//  static String productByCategory(int categoryId) => '$Server/product/$categoryId';
  // driver apis:
  static const String getOrders = '$Server/driver/orders/confirmed';
  static String getOrdersDetails(int id) => '$Server/orders/showDetails/$id';
  static String InDelivery(int id) => '$Server/in_delivery/orders/$id';
  static String Done(int id) => '$Server/driver/orders/$id/complete';


}
