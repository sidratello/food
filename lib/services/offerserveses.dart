import 'dart:convert';
import 'package:flutter_application_7/data/model/offermodel.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:http/http.dart' as http;

class OfferServices {
  Future<List<OfferModel>> getOffers() async {
    List<dynamic> data = await Api().get(url: 'http://10.0.2.2:8787/api/offers');
    List<OfferModel>offerlist=[];
    for(int i=0;i<data.length;i++){
      offerlist.add(OfferModel.fromJson(data[i]),);
    }
    return offerlist; // ✅ التحويل إلى List<String>
  }
}
