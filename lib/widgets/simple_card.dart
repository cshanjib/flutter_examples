import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final Map data;
  final int index;
  final double? width;
  final double? height;

  const SimpleCard({
    Key? key,
    required this.data,
    this.width,
    this.height,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 0 ? Colors.grey[100] : Colors.grey[50],
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(65),
                color: Colors.grey[200]),
            child: data["imageUrl"] != null
                ? Image.network(data["imageUrl"], fit: BoxFit.contain)
                : const Text(
                    "NA",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data["name"] ?? "",
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${data["currencyType"]}${data["currency"]} ${data["sellingUnit"]}",
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  data["description"],
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


