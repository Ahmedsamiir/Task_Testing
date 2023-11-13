import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:task_testing/core/constants/colors.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';
import 'package:task_testing/core/repository/authentication_repository/authentication_repository.dart';
import 'package:task_testing/feature/authentication/controller/login_controller.dart';
import 'package:task_testing/feature/authentication/controller/signup_controller.dart';
import 'package:task_testing/feature/authentication/models/user_model.dart';
import 'package:task_testing/feature/profile_screen/controllers/profile_controller.dart';
import 'package:task_testing/feature/profile_screen/presentation/screens/update_profile_screen.dart';
import 'package:task_testing/feature/profile_screen/presentation/screens/widgets/image_with_icon.dart';
import 'package:task_testing/feature/profile_screen/presentation/screens/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;

                  //Controllers
                  final email = TextEditingController(text: user.email);
                  final fullName = TextEditingController(text: user.fullName);
                  return Column(
                    children: [
                      /// -- IMAGE with ICON
                      const ImageWithIcon(),
                      const SizedBox(height: 10),
                      Text(fullName.text, style: Theme.of(context).textTheme.headlineMedium),
                      Text(email.text, style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 20),

                      /// -- BUTTON
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => UpdateProfileScreen()),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                          child: const Text(tEditProfile, style: TextStyle(color: tDarkColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 10),

                      /// -- MENU
                      ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
                      ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
                      ProfileMenuWidget(
                          title: "User Management",
                          icon: LineAwesomeIcons.user_check,
                          onPress: () {
                            // Get.to(AllUsers(),),;
                          }),
                      const Divider(),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
                      ProfileMenuWidget(
                          title: "Logout",
                          icon: LineAwesomeIcons.alternate_sign_out,
                          textColor: Colors.red,
                          endIcon: false,
                          onPress: () {
                            Get.defaultDialog(
                              title: "LOGOUT",
                              titleStyle: const TextStyle(fontSize: 20),
                              content: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Text("Are you sure, you want to Logout?"),
                              ),
                              confirm: Expanded(
                                child: ElevatedButton(
                                  onPressed: () => AuthenticationRepository.instance.logout(),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                                  child: const Text("Yes"),
                                ),
                              ),
                              cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                            );
                          }),
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
    );
  }
}
