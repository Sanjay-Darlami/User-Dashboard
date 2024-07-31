import 'package:demo_project/appbar/custom_appbar.dart';
import 'package:demo_project/pages/home/user_widget.dart';
import 'package:demo_project/providers/user_provider.dart';
import 'package:demo_project/shimmer/user_shimmer.dart';
import 'package:demo_project/widgets/custom_empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _refreshUsers() async {
    await Provider.of<UserProvider>(context, listen: false).fetchUserList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(title: "Home", showBackButton: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: RefreshIndicator(
                onRefresh: _refreshUsers,
                child: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    if (userProvider.isRefreshing) {
                      return const UserShimmer();
                    } else {
                      final userList = userProvider.userList;
                      if (userList == null || userList.isEmpty) {
                        return const CustomEmptyWidget(
                            message: 'No users found');
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            final user = userList[index];
                            return UserWidget(user: user);
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
