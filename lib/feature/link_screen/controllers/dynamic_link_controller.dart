import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:task_testing/feature/view_screen/presentation/view_screen.dart';

class DynamicLinkController extends GetxController {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  /// --- Creation Of Link Here
  Future<String> createLink(String name, String email) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://tasktesting.page.link/profile?name=$name&email=$email"),
      uriPrefix: "https://tasktesting.page.link",
      androidParameters: const AndroidParameters(
        packageName: "com.example.task_testing",
      ),
      iosParameters: const IOSParameters(
        bundleId: "com.example.task_testing",
      ),
    );
    final unguessableDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
    );

    return unguessableDynamicLink.shortUrl.toString();
  }

  /// --- Init Dynamic Link
  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final String deepLink = dynamicLinkData.link.toString();

      final Map<String, String> queryParameters = dynamicLinkData.link.queryParameters;

      log(dynamicLinkData.link.toString());

      if (deepLink.isEmpty) return;
      handleDeepLink(queryParameters);
    }).onError((error) {});
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      final initialLink = await dynamicLinks.getInitialLink();
      if (initialLink == null) return;
      handleDeepLink(initialLink.link.queryParameters);
    } catch (e) {
      log(e.toString());
    }
  }

  /// --- Handling Deep Link

  void handleDeepLink(Map<String, String> queryParameters) {
    String? name = queryParameters['name'];
    String? email = queryParameters['email'];
    if (name != null && email != null) {
      Get.to(ViewScreen(
        name: name,
        email: email,
      ));
    }
  }
}
