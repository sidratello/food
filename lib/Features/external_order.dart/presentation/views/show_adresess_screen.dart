import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/customdialog.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/external_order_for_exsisted_adress_controller.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/external_order_screen.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/wedjet/customtextforshowadress.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/show_adresess_controller.dart';

import 'package:flutter_application_7/core/constant/imageassets.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  late final ShowAddressController controller;
    late final ExternalOrderExsistedAdressController orderforexsistedadress;

  @override
  void initState() {
    super.initState();
    // أنشئ نسخة جديدة من الكنترولر لهذه الشاشة
    controller = Get.put(ShowAddressController(), tag: 'AddressList');
    orderforexsistedadress = Get.put(ExternalOrderExsistedAdressController());
    // اطلب تحديث البيانات بعد أول فريم (يضمن أنه يشتغل كل مرة تفتح الشاشة)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchAddresses();
    });
  }

  @override
  void dispose() {
    // احذف الكنترولر عند مغادرة الشاشة لكي لا يحتفظ بحالة قديمة
    Get.delete<ShowAddressController>(tag: 'AddressList');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عناويني'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchAddresses, // زر تحديث يدوي إضافي
          ),
        ],
      ),

      // زر إضافة عنوان حتى لو القائمة ليست فارغة
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_location_alt_outlined),
        onPressed: () async {
          final bool? added = await Get.to<bool>(() => const AddAddressScreen());
          if (added == true) {
            await controller.fetchAddresses();
          }
        },
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.addresses.isEmpty) {
          return _EmptyState(
            imageAsset: AppImageAsset.emty_adress,
            onAdd: () async {
              final bool? added = await Get.to<bool>(() => const AddAddressScreen());
              if (added == true) {
                await controller.fetchAddresses();
              }
            },
          );
        }

        return RefreshIndicator(
          onRefresh: controller.fetchAddresses,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: controller.addresses.length,
            itemBuilder: (context, index) {
              final a = controller.addresses[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 1.5,
                child: ListTile(
                  leading: const Icon(Icons.place, color: AppColor.pink),
                  title:  CustomTextadress( style: const TextStyle(fontWeight: FontWeight.bold), text: a.city,),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextadress(text:'${a.street} • بناء ${a.building} • طابق ${a.floor}', style: const TextStyle(fontWeight: FontWeight.bold),),
                      if ((a.notes ?? '').isNotEmpty) Text(a.notes!, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
      //               onTap: () async {
      //               final confirm = await showCustomDialog(
      //                 context: context,    
      //                 message: ' : سيتم إنشاء طلب توصيل لهذا العنوان/n  ${a.city}, ${a.street}',cancelText:'إلغاء' ,confirmText: 'تأكيد',
      //                 onConfirm: () async {
      // final ok = await orderforexsistedadress.addExternalOrderforExsistedAdress(
      //   orderType: 'external',
      //   addressOption: 'manual',
      //   manualOption: 'existing',
      //   addressId: a.id,
      // );

      onTap: () async { 
        final confirm = await 
       showDialog<bool>( 
         context: context, 
          builder: (_) => AlertDialog( 
             title: const Text('تأكيد الطلب'),
               content: Text('سيتم إنشاء طلب توصيل لهذا العنوان:\n${a.city}, ${a.street}'), 
                actions: [ 
                   TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('إلغاء')), 
                    ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('تأكيد')), 
                     ],
                       )  );
                        if (confirm != true) return; final ok = await orderforexsistedadress.addExternalOrderforExsistedAdress( orderType: 'external', addressOption: 'manual', manualOption: 'existing', addressId: a.id, );

      if (ok) {
        // اختياري: الانتقال أو إظهار رسالة نجاح
        // Get.to(() => const ShowOrdersScreen());
      }
      }
                    
                    // showDialog<bool>(
                    //   context: context,
                    //   builder: (_) => AlertDialog(
                    //     title: const Text('تأكيد الطلب'),
                    //     content: Text('سيتم إنشاء طلب توصيل لهذا العنوان:\n${a.city}, ${a.street}'),
                    //     actions: [
                    //       TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('إلغاء')),
                    //       ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('تأكيد')),
                    //     ],
                    //   ),
                    // );
        
                  
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String imageAsset;
  final VoidCallback onAdd;
  const _EmptyState({required this.imageAsset, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, height: 160),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add_location_alt_outlined),
              label: const Text('إضافة عنوان جديد'),
            ),
          ],
        ),
      ),
    );
  }
}
