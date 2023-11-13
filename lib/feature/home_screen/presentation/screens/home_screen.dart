import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';
import 'package:task_testing/feature/authentication/controller/signup_controller.dart';
import 'package:task_testing/feature/link_screen/presentation/screens/link_screen.dart';
import 'package:task_testing/feature/profile_screen/presentation/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// ---- Name Section 1
                const SizedBox(
                  height: tDefaultSize,
                ),
                Center(child: Text("$tHomeTitle ${controller.fullName.text}", style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center)),
                const SizedBox(
                  height: tDefaultSize * 2.5,
                ),

                /// ---- Buttons Section 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() =>  LinkScreen());
                        },
                        child: Text(tMyLink.toUpperCase()),
                      ),
                    ),

                    SizedBox(
                      width: 150,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const ProfileScreen());
                        },
                        child: Text(tMyProfile.toUpperCase()),
                      ),
                    ),
                    // SizedBox(
                    //   width: 150,
                    //   child: OutlinedButton(
                    //       onPressed: () {
                    //         Get.to(() => const LinkScreen());
                    //       },
                    //       child: Text(
                    //         tMyLink,
                    //         style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    //       )),
                    // ),

                    // SizedBox(
                    //   width: 150,
                    //   child: OutlinedButton(
                    //       onPressed: () => Get.to(() =>  const ProfileScreen()),
                    //       child: Text(
                    //         tMyProfile,
                    //         style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    //       )),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
