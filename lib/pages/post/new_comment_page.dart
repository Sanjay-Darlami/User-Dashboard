import 'package:demo_project/appbar/custom_appbar.dart';
import 'package:demo_project/models/post/post.dart';
import 'package:demo_project/providers/post_provider.dart';
import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:demo_project/widgets/custom_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCommentPage extends StatefulWidget {
  final Post post;
  const NewCommentPage({super.key, required this.post});

  @override
  State<NewCommentPage> createState() => _NewCommentPageState();
}

class _NewCommentPageState extends State<NewCommentPage> {
  TextEditingController commentController = TextEditingController();

  handlePostComment() {
    if (commentController.text.isEmpty) {
      SnackbarUtils.showSnackbar(context, "Please provide your comment");

      return;
    }
    Map<String, dynamic>? map = {};
    map['userId'] = 1;
    map['comments'] = commentController.text;
    Provider.of<PostProvider>(context, listen: false)
        .postUserComment(widget.post.id!, map)
        .then((isSuccess) async {
      if (isSuccess) {
        SnackbarUtils.showSnackbar(context, "Your comment has been successful");
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        SnackbarUtils.showSnackbar(
            context, "Something went wrong, please try later!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Post a comment",
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: commentController,
                    maxLines: 5,
                    maxLength: 150,
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
                  InkWell(
                    onTap: () {
                      handlePostComment();
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        color: ColorUtil.colorOrange,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: StyleUtil.style14White,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            postProvider.isPostingcomment
                ? const CustomCircularIndicator()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
