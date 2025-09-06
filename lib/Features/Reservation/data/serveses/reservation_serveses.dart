import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ReservationService{

Future<Map<String, dynamic>>    AddReservation( String date,
     int guestsCount,
   String notes,
    String startTime,
  String endTime,String token )async{

final res=await Api().post(url:Applink.reservation(),    body: <String, dynamic>{
      "date": date,                 // مثال: 2025-08-20
      "starttime": startTime,       // مثال: 09:30
      "endtime": endTime,           // مثال: 10:30
      "guests_count": guestsCount,  // رقم
      "notes": notes, 

        }, token:token);

        return Map<String, dynamic>.from(res); //form convert the responce to  Map<String, dynamic> because the post return dynamic

}


 


}

