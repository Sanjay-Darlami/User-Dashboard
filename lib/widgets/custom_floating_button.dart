import 'package:demo_project/utils/color_util.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const CustomFloatingButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      mini: true,
      shape: const CircleBorder(),
      backgroundColor: ColorUtil.colorOrange,
      child: Icon(icon, color: ColorUtil.colorWhite),
    );
  }
}
