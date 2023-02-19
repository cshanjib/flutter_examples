import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_examples/utils/mock_utils.dart';
import 'package:flutter_examples/widgets/simple_card.dart';

class AndroidIndicatorExample extends StatefulWidget {
  const AndroidIndicatorExample({Key? key}) : super(key: key);

  @override
  State<AndroidIndicatorExample> createState() =>
      _AndroidIndicatorExampleState();
}

class _AndroidIndicatorExampleState extends State<AndroidIndicatorExample> {
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
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: (context, index) => SimpleCard(
            data: itemList[index],
            index: index,
          ),
          itemCount: itemList.length,
        ));
  }
}
