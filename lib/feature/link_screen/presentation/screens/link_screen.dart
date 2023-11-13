
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';
import 'package:task_testing/feature/authentication/controller/signup_controller.dart';
import 'package:task_testing/feature/link_screen/controllers/dynamic_link_controller.dart';
import 'package:task_testing/feature/profile_screen/controllers/profile_controller.dart';
import 'package:task_testing/feature/view_screen/presentation/view_screen.dart';

class LinkScreen extends StatelessWidget {
   LinkScreen({super.key});

  final  dynamicLinkController = Get.put(DynamicLinkController());
  final  signUpController= Get.put(SignUpController());

  //final String name = signUpController.fullName.text;

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

                 Text(tNowYouCanShareLink,style:Theme.of(context).textTheme.displaySmall, ),
                const SizedBox(height: tDefaultSize * 2),
                GestureDetector(
                  onTap: () {
                    // Handle the tap on the dynamic link text
                    // You can navigate to the relevant screen using GetX navigation or any other method
                     //Get.toNamed(const ViewScreen() as String, arguments: dynamicLinkController.linkData);
                  },
                  child: Text(
                   // 'Dynamic Link: ${dynamicLinkController.linkData}',
                    "www.mylink.com/Ahmed",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue),
                  ),

                ),
                const SizedBox(height:tDefaultSize),
                SizedBox(
                  width: 100,
                  child: OutlinedButton(
                    onPressed: () async {

                      final share = await dynamicLinkController.createDynamicLink(false, "Ahmed");
                      print("dynamicLinkController dynamicLinkController ==> ${share}");
                      Get.toNamed(const ViewScreen() as String);

                      // Implement share functionality here
                      // You can use the share package or any other method to share the link
                      // Example using the share package:
                      // share(dynamicLinkController.linkData);
                    },
                    child:   Text(tShare, style:Theme.of(context).textTheme.titleSmall,),
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
