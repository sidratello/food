// file: Features/Auth/presentation/views/VeryFayScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/otpcontroller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// استخدم الكونترولر الموحّد الذي أنشأناه:


class VerifyCodeScreen extends StatelessWidget {
  final bool fromSignup;
  final int userId;

  VerifyCodeScreen({
    super.key,
    required this.fromSignup,
    required this.userId,
  });

  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // نضمن وجود OtpController في الشجرة
    final OtpController otpController = Get.put(OtpController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // رجوع طبيعي (لو حاب تمنعه استخدم Get.offAllNamed أو اغلق الحوار فقط)
            Get.back();
          },
        ),
        title: const Text("Verification"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Enter the code we sent to your phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 30),

                // حقول OTP
                PinCodeTextField(
                  appContext: context,
                  length: 5,
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  autoDismissKeyboard: true,
                  animationType: AnimationType.fade,
                  onChanged: (_) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    activeColor: Colors.pink,              // اللون أثناء الكتابة
                    selectedColor: Colors.pinkAccent,      // اللون للحقل المحدد
                    inactiveColor: Colors.pink.shade100,   // اللون للحقل غير النشط
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),

                const SizedBox(height: 10),

                // إعادة إرسال الكود (اربطه بسيرفس الإرسال عندك)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive code? "),
                    GestureDetector(
                      onTap: () {
                        // TODO: استدعِ API إعادة الإرسال لديك
                        Get.snackbar("إعادة الإرسال", "سيتم إرسال الكود مرة أخرى (اربط الـ API هنا)");
                      },
                      child: const Text(
                        "Resend code",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // زر التحقق
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      final code = _codeController.text.trim();

                      if (code.isEmpty || code.length < 5) {
                        Get.snackbar("تنبيه", "أدخل رمز التحقق بشكل صحيح");
                        return;
                      }

                      await otpController.verifyOtp(
                        userId: userId,
                        code: code,
                        fromSignup: fromSignup,
                      );
                      // ملاحظة: OtpController هو الذي يتكفل بالتنقل:
                      // fromSignup=true  -> HomePage()
                      // fromSignup=false -> New_Password_Screen(userId)
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
