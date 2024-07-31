import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class AlertUtil {
  Future<void> showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Delete Confirmation',
            textAlign: TextAlign.center,
            style: StyleUtil.style16DarkBlueBold,
          ),
          content: const SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Are you sure you want to delete todos?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: StyleUtil.style14Grey,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // dismiss dialog
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: StyleUtil.style14Red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                SnackbarUtils.showSnackbar(
                    context, "Todos deleted successfully");
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showUpdateDialog(
      BuildContext context, String initialValue) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Update Todos',
            textAlign: TextAlign.center,
            style: StyleUtil.style16DarkBlueBold,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    initialValue: initialValue,
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      focusColor: ColorUtil.colorOrange,
                      hintStyle: StyleUtil.style14Grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: ColorUtil.colorGrey,
                            width: 1.0), // Grey border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: ColorUtil.colorOrange,
                            width: 2.0), // Orange border color on focus
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: ColorUtil.colorGrey,
                            width: 1.0), // Grey border color when enabled
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: StyleUtil.style14Grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Update',
                style: StyleUtil.style14Green,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                SnackbarUtils.showSnackbar(
                    context, "Todos updated successfully");
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showAddTodosDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add a new todos',
            textAlign: TextAlign.center,
            style: StyleUtil.style16DarkBlueBold,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    focusColor: ColorUtil.colorOrange,
                    hintStyle: StyleUtil.style14Grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: ColorUtil.colorGrey,
                          width: 1.0), // Grey border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: ColorUtil.colorOrange,
                          width: 2.0), // Orange border color on focus
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: ColorUtil.colorGrey,
                          width: 1.0), // Grey border color when enabled
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: StyleUtil.style14Grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Add',
                style: StyleUtil.style14Green,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                SnackbarUtils.showSnackbar(context, "Todos added successfully");
              },
            ),
          ],
        );
      },
    );
  }
}
