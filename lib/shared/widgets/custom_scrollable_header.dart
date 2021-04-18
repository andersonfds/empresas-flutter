import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'search_widget.dart';

class CustomScrollableHeader extends SliverPersistentHeaderDelegate {
  final ValueChanged<String>? onChanged;

  CustomScrollableHeader({this.onChanged});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/header_gradient.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchWidget(onChanged: onChanged),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
