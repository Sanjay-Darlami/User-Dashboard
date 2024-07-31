import 'package:demo_project/appbar/custom_appbar.dart';
import 'package:demo_project/models/user/user.dart';
import 'package:demo_project/pages/photos/album_page.dart';
import 'package:demo_project/pages/post/post_page.dart';
import 'package:demo_project/pages/todos/todos_page.dart';
import 'package:demo_project/providers/preferences_provider.dart';
import 'package:demo_project/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatefulWidget {
  final User user;
  const UserDetailPage({super.key, required this.user});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final PageStorageBucket bucket = PageStorageBucket();
  late PreferencesProvider preferencesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the PreferencesProvider instance here
    preferencesProvider =
        Provider.of<PreferencesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: CustomAppbar(
          title: "${widget.user.name}",
          showBackButton: true,
          tabBar: TabBar(
            indicatorColor: ColorUtil.colorOrange,
            labelColor: ColorUtil.colorOrange,
            overlayColor: MaterialStateProperty.all<Color>(
                ColorUtil.colorOrange.withOpacity(0.1)),
            tabs: const [
              Tab(text: 'Posts'),
              Tab(text: 'Albums'),
              Tab(text: 'Todos'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageStorage(
            bucket: bucket,
            child: TabBarView(
              children: [
                PostPage(user: widget.user),
                AlbumPage(user: widget.user),
                TodosPage(user: widget.user),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    preferencesProvider.clearPosts(widget.user.id!);
    super.dispose();
  }
}
