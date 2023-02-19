import 'package:flutter/material.dart';
import 'package:flutter_examples/pull_to_refresh/android_indicator_example.dart';
import 'package:flutter_examples/pull_to_refresh/ios_indicator_example.dart';
import 'package:flutter_examples/pull_to_refresh/platform_pull_to_refresh_example.dart';

class PullToRefreshExample extends StatelessWidget {
  const PullToRefreshExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pull to refresh Example"),
        ),
        body: const PlatformPullToRefreshExample()
        // body: const IosIndicatorExample()
        // body: const AndroidIndicatorExample()

    );
  }
}
