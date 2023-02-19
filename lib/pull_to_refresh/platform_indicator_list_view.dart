import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformIndicatorListView extends StatelessWidget {
  final int count;
  final Future<void> Function() onRefresh;
  final IndexedWidgetBuilder itemBuilder;

  const PlatformIndicatorListView(
      {Key? key,
      required this.count,
      required this.onRefresh,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CustomScrollView(
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: onRefresh,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(itemBuilder,
                      childCount: count))
            ],
          )
        : RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(itemBuilder: itemBuilder, itemCount: count),
          );
  }
}
