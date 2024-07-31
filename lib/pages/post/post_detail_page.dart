import 'package:demo_project/appbar/custom_appbar.dart';
import 'package:demo_project/models/post/post.dart';
import 'package:demo_project/pages/post/comments_widget.dart';
import 'package:demo_project/pages/post/new_comment_page.dart';
import 'package:demo_project/pages/post/post_intro_card.dart';
import 'package:demo_project/providers/post_provider.dart';
import 'package:demo_project/shimmer/post_shimmer.dart';
import 'package:demo_project/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;
  const PostDetailPage({super.key, required this.post});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostProvider>(context, listen: false)
          .fetchUserPostCommentsList(widget.post.id!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: CustomAppbar(
        title: widget.post.title,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PostIntroCard(post: widget.post),
              const SizedBox(height: 20),
              postProvider.commentsList == null
                  ? const PostShimmer()
                  : postProvider.commentsList!.isEmpty
                      ? const Text("No Comments")
                      : CommentsWidget(
                          commentsList: postProvider.commentsList!),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewCommentPage(post: widget.post),
              ),
            );
          },
          icon: Icons.comment),
    );
  }
}
