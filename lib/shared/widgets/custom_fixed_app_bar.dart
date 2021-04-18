import 'package:app/shared/widgets/square_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFixedAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomFixedAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Spacer(),
                  Text(
                    title,
                    style: Get.textTheme.bodyText2?.apply(
                      fontWeightDelta: 400,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SquareButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
