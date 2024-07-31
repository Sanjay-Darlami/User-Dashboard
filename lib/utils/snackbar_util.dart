import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: StyleUtil.style14White,
      ),
      backgroundColor: ColorUtil.colorOrange,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
