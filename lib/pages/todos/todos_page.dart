import 'package:demo_project/models/todos/todos.dart';
import 'package:demo_project/models/user/user.dart';
import 'package:demo_project/pages/todos/todos_widget.dart';
import 'package:demo_project/providers/todos_provider.dart';
import 'package:demo_project/shimmer/todos_shimmer.dart';
import 'package:demo_project/utils/alert_util.dart';
import 'package:demo_project/widgets/custom_empty_widget.dart';
import 'package:demo_project/widgets/custom_error_widget.dart';
import 'package:demo_project/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatefulWidget {
  final User user;
  const TodosPage({super.key, required this.user});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: Provider.of<TodosProvider>(context, listen: false)
            .fetchUserTodosList(widget.user.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const TodosShimmer();
          } else if (snapshot.hasError) {
            return const CustomErrorWidget(
                errorMessage: "Error fetching todos");
          } else {
            return Consumer<TodosProvider>(
              builder: (context, todosProvider, child) {
                final todostList = todosProvider.todostList;
                if (todostList == null || todostList.isEmpty) {
                  return const CustomEmptyWidget(message: "No todos found");
                } else {
                  return ListView.builder(
                    itemCount: todostList.length,
                    itemBuilder: (context, index) {
                      Todos todos = todostList[index];
                      return TodosWidget(todos: todos);
                    },
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: CustomFloatingButton(
          onPressed: () {
            AlertUtil().showAddTodosDialog(context);
          },
          icon: Icons.add),
    );
  }
}
