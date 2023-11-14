import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';
import 'package:task_testing/feature/authentication/controller/signup_controller.dart';
import 'package:task_testing/feature/link_screen/controllers/dynamic_link_controller.dart';

class LinkScreen extends StatelessWidget {
  LinkScreen({super.key, required this.link});

  final dynamicLinkController = Get.put(DynamicLinkController());
  final signUpController = Get.put(SignUpController());
  final String link;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tNowYouCanShareLink,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: tDefaultSize * 2),

                /// --- Preview Link Here
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    link,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: tDefaultSize),

                /// ---- Share Button
                SizedBox(
                  width: 100,
                  child: OutlinedButton(
                    onPressed: () async {
                      await Share.share('check out my profile $link');
                    },
                    child: Text(
                      tShare,
                      style: Theme.of(context).textTheme.titleSmall,
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
