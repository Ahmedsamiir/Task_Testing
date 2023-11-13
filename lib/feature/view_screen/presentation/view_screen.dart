import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic> arguments = Get.arguments;
    // String name = arguments['name'];
    // String email = arguments['email'];

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child:  Column(
            children: [
              const SizedBox(height: tDefaultSize,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(tFullName, style: Theme.of(context).textTheme.titleMedium,),
                  Text("name", style: Theme.of(context).textTheme.titleSmall,)
                ],
              ),
              const SizedBox(height: tDefaultSize / 3,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(tEmail, style: Theme.of(context).textTheme.titleMedium,),
                  Text("email", style: Theme.of(context).textTheme.titleSmall,)
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
