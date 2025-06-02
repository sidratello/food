

import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? validatePhoneNumber(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'you have to enter PhoneNumber';
  }

  // if (!phone.startsWith('09') || phone.length != 10 ) {
  //   return 'the phone number is incorrect. It should start with 09 \n and contain 10 digits';
  // }

  return null; // صحيح
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'you have to write password';
  }



  return null; // صحيح
}

String? validateUsername(String? username) {
  if (username == null || username.isEmpty) {
    return 'you have to write your name';
  }

  return null; // صالح
}

