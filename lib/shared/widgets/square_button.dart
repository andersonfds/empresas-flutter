import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SquareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.black.withOpacity(0.05),
      borderRadius: BorderRadius.circular(4.0),
      child: InkWell(
        onTap: Get.back,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.keyboard_backspace,
            color: Get.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
