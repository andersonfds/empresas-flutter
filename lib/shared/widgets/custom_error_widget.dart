import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final String asset;

  const CustomErrorWidget({
    Key? key,
    required this.message,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: Vector.name(asset),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              message,
              style: Get.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
