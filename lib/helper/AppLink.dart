class Applink {
  static const String Server =
  //  'https://res.mustafafares.com/api';
      //  "http://192.168.1.2:8000/api";
          "http://192.168.43.222:8000/api";
  static const String imageBaseUrl =
    // 'https://res.mustafafares.com/';
    //  'http://192.168.1.2:8000/';
  'http://192.168.43.222:8000/';
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

  static const String addorder = '$Server/addorder';

static String DeletFromFav(int product_id) => '$Server/deletfromFavourite/$product_id';
static String DeletFromCart(int product_id) => '$Server/deletfromcart/$product_id';

 static const  String ShowAdress='$Server/addresses';
  static const  String ShowOrder='$Server/orders';
    static const  String profile='$Server/showProfile';
    static const  String updateProfile='$Server/updateProfile';
   static const  String logout='$Server/logout';
      static const  String rating='$Server/rate';
      static const  String showrating='$Server/topRatedProducts';

 static String deletrating(int categoryId) {
    return '$Server/rate/$categoryId';

  }
 static const  String fillmuhfaza='$Server/addWallet';
 static const  String showmuhfaza='$Server/Wallet';


}
