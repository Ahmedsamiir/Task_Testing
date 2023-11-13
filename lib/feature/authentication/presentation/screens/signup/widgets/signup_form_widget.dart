import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/constants/text_strings.dart';
import '../../../../controller/signup_controller.dart';
import '../../../../models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope)),
            ),
            const SizedBox(height: tFormHeight - 20),
            // TextFormField(
            //   controller: controller.phoneNo,
            //   decoration: const InputDecoration(label: Text(tPhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone)),
            // ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: tFormHeight - 10),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      /// Email & Password Authentication
                      // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                      /// For Phone Authentication
                      // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

                      final user = UserModel(
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        //phoneNo: controller.phoneNo.text.trim(),
                      );
                      SignUpController.instance.createUser(user);
                    }
                  },
                  child: controller.isLoading.value
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Loading...")
                          ],
                        )
                      : Text(tSignup.toUpperCase()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
