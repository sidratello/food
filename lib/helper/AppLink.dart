class Applink {

static const  String Server='http://192.168.1.18:8000/api';
static const  String login='$Server/login';
static const  String Signup='$Server/register';
static const  String ForgetPassword='$Server/forgotPa';
static const  String VaryFayScreen='$Server/verify2/6';
static String verifyCodeUrl(int userId) => '$Server/verify2/$userId';
static String RePaswordUrl(int userId) => '$Server/reserpa/$userId';
static String verifyCodeUrlFirst(int userId) => '$Server/verify/$userId';

}
