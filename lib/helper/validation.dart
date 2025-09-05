

import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? validatePhoneNumber(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'you have to enter PhoneNumber';
  }



  return null; // if we dont have any error it didnt return the message error 
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'you have to write password';
  }

  if (password.length < 8) {
  

    return 'password must be at least 8 characters';
  }

  return null;
}
String? validateUsername(String? username) {
  if (username == null || username.isEmpty) {
    return 'you have to write your name';
  }

  return null; // صالح
}

String? validateLocation(String? location) {
  if (location == null || location.isEmpty) {
    return 'you have to write your location';
  }

  return null; // صالح
}