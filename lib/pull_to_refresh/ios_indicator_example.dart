import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/utils/mock_utils.dart';
import 'package:flutter_examples/widgets/simple_card.dart';

class IosIndicatorExample extends StatefulWidget {
  const IosIndicatorExample({Key? key}) : super(key: key);

  @override
  State<IosIndicatorExample> createState() => _IosIndicatorExampleState();
}

class _IosIndicatorExampleState extends State<IosIndicatorExample> {
  List itemList = MockUtils.getAllProducts();

  Future<void> _onRefresh() async {
    final randomIndex = Random().nextInt(itemList.length);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      itemList = [itemList[randomIndex], ...itemList];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: _onRefresh
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => SimpleCard(data: itemList[index]),
                childCount: itemList.length))
      ],
    );
    // return RefreshIndicator(
    //     onRefresh: _onRefresh,
    //     child: ListView.builder(
    //       itemBuilder: (context, index) => SimpleCard(
    //         data: itemList[index],
    //         index: index,
    //       ),
    //     ));
  }
}
