import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String message;
  const CustomEmptyWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: StyleUtil.style14Black,
      ),
    );
  }
}
