import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_examples/pull_to_refresh/platform_indicator_list_view.dart';
import 'package:flutter_examples/utils/mock_utils.dart';
import 'package:flutter_examples/widgets/simple_card.dart';

class PlatformPullToRefreshExample extends StatefulWidget {
  const PlatformPullToRefreshExample({Key? key}) : super(key: key);

  @override
  State<PlatformPullToRefreshExample> createState() =>
      _PlatformPullToRefreshExampleState();
}

class _PlatformPullToRefreshExampleState
    extends State<PlatformPullToRefreshExample> {
  List itemList = MockUtils.getAllProducts();

  Future<void> _onRefresh() async {
    final randomIndex = Random().nextInt(itemList.length);

    await Future.delayed(const Duration(seconds: 10));

    setState(() {
      itemList = [itemList[randomIndex], ...itemList];
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformIndicatorListView(
      count: itemList.length,
      onRefresh: _onRefresh,
      itemBuilder: (context, index) => SimpleCard(
        data: itemList[index],
        index: index,
      ),
    );
  }
}
