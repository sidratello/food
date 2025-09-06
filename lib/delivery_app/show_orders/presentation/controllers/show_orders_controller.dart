import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ShowOrdersController extends GetxController {
  var orders = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var isSearching = false.obs; //is the user search now ?
  var searchResults = [].obs;   //search result
  Api api = Api();

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {

    try {
      errorMessage.value = '';
      isLoading.value = true;
      Map<String, dynamic> response = await api.get(url: Applink.getOrders, sendToken: true);
      print(response['orders']);

      orders.value = [];
      for (var order in response['orders']) {
        orders.add(order);
      }
    } catch (exception) {
      errorMessage.value = exception.toString();
    } finally {
      isLoading.value = false;
    }


  }
}