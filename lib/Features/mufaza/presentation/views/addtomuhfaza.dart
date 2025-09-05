import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/controller/show_mufaza.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/wedjet/walletcard.dart';
import 'package:get/get.dart';

import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/controller/fill_muhfaza_controller.dart';


class WalletTopUpPage extends StatefulWidget {
  const WalletTopUpPage({super.key});

  @override
  State<WalletTopUpPage> createState() => _WalletTopUpPageState();
}

class _WalletTopUpPageState extends State<WalletTopUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _codeCtrl = TextEditingController();

  // كنترولر الشحن (فقط لتنفيذ الشحن)
  final AddToMuhfazaController _topupCtrl = Get.find<AddToMuhfazaController>();
  // كنترولر العرض من السيرفر
 final _walletCtrl = Get.find<ShowMufazaController>();



  @override
  void dispose() {
    _codeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: true,
      appBarTitle: 'المحفظة',
      showNavBar: false,
      showBackButton: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: RefreshIndicator(
            onRefresh: _walletCtrl.fetchWallet,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  /// ---- كارد رصيد المحفظة من السيرفر ----
                  Obx(() {
                    if (_walletCtrl.isLoading.value) {
                      return WalletCard(
                        title: 'الرصيد الحالي',
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                    if (_walletCtrl.errorMessage.isNotEmpty) {
                      return WalletCard(
                        title: 'الرصيد الحالي',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _walletCtrl.errorMessage.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton.icon(
                              onPressed: _walletCtrl.fetchWallet,
                              icon: const Icon(Icons.refresh),
                              label: const Text('إعادة المحاولة'),
                            ),
                          ],
                        ),
                      );
                    }

                    return WalletCard(
                      title: 'الرصيد الحالي',
                      child: Row(
                        children: [
                          const Icon(Icons.account_balance_wallet_outlined, size: 28),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('محفظتك',
                                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                                const SizedBox(height: 4),
                                Text(
                                  _walletCtrl.formattedBalance, // مثال: 1200180.00 USD
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            tooltip: 'تحديث',
                            onPressed: _walletCtrl.fetchWallet,
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  /// ---- حقل كود الشحن ----
                  TextFormField(
                    controller: _codeCtrl,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'أدخل كود الشحن',
                      hintText: 'مثال: 7OFR7TBOEH',
                      prefixIcon: const Icon(Icons.confirmation_number_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        tooltip: 'لصق من الحافظة',
                        icon: const Icon(Icons.content_paste_go_outlined),
                        onPressed: () async {
                          final data = await Clipboard.getData(Clipboard.kTextPlain);
             
                        },
                      ),
                    ),
      
                    validator: (v) {
                      final value = (v ?? '').trim();
                      if (value.isEmpty) return 'الرجاء إدخال الكود';
                      if (value.length < 6) return 'الكود قصير جدًا';
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  /// ---- زر الشحن ----
                  Obx(() {
                    final loading = _topupCtrl.isLoading.value;
                    return SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: loading
                            ? null
                            : () async {
                                if (_formKey.currentState?.validate() ?? false) {
                                  FocusScope.of(context).unfocus();
                                  await _topupCtrl.addToMuhfaza(_codeCtrl.text.trim());
                                  // بعد الشحن حدّث رصيد المحفظة من السيرفر
                                  await _walletCtrl.fetchWallet();
                                }
                              },
                        icon: loading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.flash_on_outlined),
                        label: Text(loading ? 'يتم التنفيذ...' : 'شحن الآن'),
                      ),
                    );
                  }),

           
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
