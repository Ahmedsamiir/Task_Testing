import 'package:flutter/material.dart';
import 'package:task_testing/core/constants/sizes.dart';
import 'package:task_testing/core/constants/text_strings.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key, required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: tDefaultSize,
                ),

                /// ---- Title [Name - Email]
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: tDefaultSize,
                    ),
                    Text(
                      tEmail,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                const SizedBox(
                  width: tDefaultSize / 3,
                ),

                /// ---- Show Results Of  [Name - Email]
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: tDefaultSize,
                    ),
                    Text(
                      email,
                      style: Theme.of(context).textTheme.titleSmall,
                    )
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
