import 'package:demo_project/models/todos/todos.dart';
import 'package:demo_project/utils/alert_util.dart';
import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class TodosWidget extends StatelessWidget {
  final Todos todos;
  const TodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showActionOptions(context, todos);
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 4.0,
        color: todos.completed! ? ColorUtil.colorGreen : ColorUtil.colorRed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '${todos.title}',
            style: StyleUtil.style14White,
          ),
        ),
      ),
    );
  }

  void showActionOptions(BuildContext context, Todos todos) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Choose an option",
                style: StyleUtil.style16Black,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        AlertUtil().showDeleteConfirmationDialog(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorUtil.colorOrange, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: ColorUtil.colorOrange,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Icon(Icons.delete,
                                  size: 32, color: ColorUtil.colorWhite),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Delete",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        AlertUtil().showUpdateDialog(context, todos.title!);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorUtil.colorOrange, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: ColorUtil.colorOrange,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Icon(Icons.edit,
                                  size: 32, color: ColorUtil.colorWhite),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Update",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
