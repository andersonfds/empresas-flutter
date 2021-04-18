import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  final bool expanded;

  const CustomAppBar({
    Key? key,
    required this.child,
    required this.expanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      width: double.infinity,
      height: expanded ? 230 : 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/gradient.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(
            MediaQuery.of(context).size.width,
            100.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(child: child),
      ),
    );
  }
}
