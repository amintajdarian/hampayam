import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double size;
  BottomBar(this.size);
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      height: size / 20,
      top: -1 * size / 50,
      curveSize: size / 12,
      cornerRadius: size / 20,
      activeColor: Colors.yellow,
      style: TabStyle.fixed,
      items: [
        TabItem(icon: Icons.link),
        TabItem(icon: Icons.wallet_giftcard),
        TabItem(title: "2020", icon: Icons.wallet_giftcard),
      ],
      initialActiveIndex: 1,
      onTap: (int i) => print('click index=$i'),
    );
  }
}
