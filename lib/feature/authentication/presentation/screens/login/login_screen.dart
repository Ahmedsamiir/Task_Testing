import 'package:flutter/material.dart';
import 'package:task_testing/core/constants/image_strings.dart';
import 'package:task_testing/core/constants/text_strings.dart';
import '../../../../../core/common_widgets/form/form_header_widget.dart';
import '../../../../../core/constants/sizes.dart';
import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              children: [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                LoginFormWidget(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
