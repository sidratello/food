import 'package:flutter_application_7/Features/show_order/data/serveses/show_order_serveses.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/show_order_model.dart';


class ShowOrdersController extends GetxController {
  final show_Order_serveses _service = show_Order_serveses();

  final isLoading = false.obs;
  final orders = <OrderModel>[].obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        errorMessage.value = 'يرجى تسجيل الدخول أولاً.';
        orders.clear();
        return;
      }

      final result = await _service.show_order(token);
      orders.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
      orders.clear();
    } finally {
      isLoading.value = false;
    }
  }


}
