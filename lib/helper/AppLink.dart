class Applink {
  static const String Server = 'http://10.177.14.225:8000/api';
  static const String imageBaseUrl = 'http://10.177.14.225:8000/';
  static const String choose = '$Server/chooseRole';
  static const String login = '$Server/login';
  static const String Signup = '$Server/register';
  static const String ForgetPassword = '$Server/forgotPa';
  static const String VaryFayScreen = '$Server/verify2/6';

  static String verifyCodeUrl(int userId) => '$Server/verify2/$userId';

  static String RePaswordUrl(int userId) => '$Server/reserpa/$userId';

  static String verifyCodeUrlFirst(int userId) => '$Server/verify/$userId';
  static String Category = '$Server/category';

  static String productCategory(int categoryId) {
    return '$Server/product/$categoryId';
  }

  static const String searchforproductandcategory = '$Server/Search1';

  static const String AddtoFavourite = '$Server/addtoFavourite';
  static const  String ShowFavourit='$Server/showFav';
  static const  String AddToCart='$Server/addtocart';
  static const  String ShowCart='$Server/showcart';

  static String reservation() => '$Server/reserve';

  static String showreservation() => '$Server/showreserve';

  static String updateReservation(int id) => '$Server/update/$id';

  static String cancelReservation(int id) => '$Server/cancelReservation/$id';
}
