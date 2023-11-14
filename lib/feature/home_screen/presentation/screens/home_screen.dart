import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';
import 'package:task_testing/feature/authentication/models/user_model.dart';
import 'package:task_testing/feature/link_screen/controllers/dynamic_link_controller.dart';
import 'package:task_testing/feature/link_screen/presentation/screens/link_screen.dart';
import 'package:task_testing/feature/profile_screen/presentation/screens/profile_screen.dart';
import '../../../profile_screen/controllers/profile_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamicLinkController = Get.put(DynamicLinkController());
    final controller = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel user = snapshot.data as UserModel;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// ---- Name Section 1
                        const SizedBox(
                          height: tDefaultSize,
                        ),
                        Center(
                            child: Text("$tHomeTitle ${user.fullName}",
                                style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center)),
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
                                onPressed: () async {
                                  final share = await dynamicLinkController.createLink(user.fullName, user.email);
                                  print("dynamicLinkController dynamicLinkController ==> $share");
                                  Get.to(() => LinkScreen(
                                        link: share,
                                      ));
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
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
