import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Vector extends StatelessWidget {
  /// The name of the file
  final String name;

  /// This class is a wrapper for SvgPicture in order to
  /// avoid accessing the assets/vectors folder directly
  /// just pass the name of the file instead
  const Vector({Key? key, required this.name}) : super(key: key);

  factory Vector.name(String name) => Vector(name: 'assets/vectors/$name.svg');

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(name);
  }
}
