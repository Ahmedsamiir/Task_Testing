import 'package:flutter/material.dart';
import 'package:task_testing/core/common_widgets/form/form_header_widget.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';
import 'package:task_testing/feature/authentication/presentation/screens/signup/widgets/signup_form_widget.dart';

import '../../../../../core/constants/image_strings.dart';
import 'widgets/signup_footer_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.1,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
