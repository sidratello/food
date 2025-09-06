import 'package:flutter_application_7/data/model/orders_details_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ShowOrdersDetailsController extends GetxController {
  final int id;

  ShowOrdersDetailsController(this.id);

  List<OrdersDetails> ordersdetails = [];
  var isLoading = false.obs;
  var errorMessage = "".obs;
  Api api = Api();

  @override
  void onInit() {
    super.onInit();
    fetchOrdersDetails(id);
  }

  Future<void> fetchOrdersDetails(int id) async {
    try {
      errorMessage.value = '';
      isLoading.value = true;

      var response = await api.get(
        url: Applink.getOrdersDetails(id),
        sendToken: true,
      );

      // ✅ مرر الـ response كامل
      OrdersDetails orderDetails = OrdersDetails.fromJson(response);

      ordersdetails = [orderDetails];
      update();
    } catch (exception) {
      errorMessage.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> markAsInDelivery(int id) async {
    try {
      errorMessage.value = '';
      isLoading.value = true;
      update();

      var response = await api.post(
        url: Applink.InDelivery(id),
        sendToken: true,    body: {},
      );

      if (response != null && response['status'] == true) {
        Get.snackbar("نجاح", "تم وضع الطلب قيد التوصيل ✅");
      } else {
        Get.snackbar("خطأ", "تعذر تغيير الحالة");
      }
    } catch (e) {
      errorMessage.value = "تعذر تغيير الحالة: $e";
      Get.snackbar("خطأ", errorMessage.value);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> markAsCompleted(int id) async {
    try {
      errorMessage.value = '';
      isLoading.value = true;
      update();

      var response = await api.post(
        url: Applink.Done(id),
        sendToken: true,    body: {},
      );

      if (response != null && response['status'] == true) {
        Get.snackbar("نجاح", "تم إنهاء الطلب ✅ (أُرسل إشعار للادمن)");
      } else {
        Get.snackbar("خطأ", "تعذر إنهاء الطلب");
      }
    } catch (e) {
      errorMessage.value = "تعذر إنهاء الطلب: $e";
      Get.snackbar("خطأ", errorMessage.value);
    } finally {
      isLoading.value = false;
      update();
    }
  }

}


