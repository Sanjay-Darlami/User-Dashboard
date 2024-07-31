import 'package:demo_project/models/user/user.dart';
import 'package:demo_project/pages/post/post_widget.dart';
import 'package:demo_project/providers/post_provider.dart';
import 'package:demo_project/shimmer/post_shimmer.dart';
import 'package:demo_project/widgets/custom_empty_widget.dart';
import 'package:demo_project/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  final User user;
  const PostPage({super.key, required this.user});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: Provider.of<PostProvider>(context, listen: false)
            .fetchUserPostList(widget.user.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PostShimmer();
          } else if (snapshot.hasError) {
            return const CustomErrorWidget(
                errorMessage: 'Error fetching posts');
          } else {
            return Consumer<PostProvider>(
              builder: (context, postProvider, child) {
                final postList = postProvider.postList;
                if (postList == null || postList.isEmpty) {
                  return const CustomEmptyWidget(message: 'No post found');
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final post = postList[index];
                      return PostWidget(post: post);
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
