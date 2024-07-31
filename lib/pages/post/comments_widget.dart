import 'package:demo_project/models/post/comments.dart';
import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class CommentsWidget extends StatelessWidget {
  final List<Comments> commentsList;
  const CommentsWidget({super.key, required this.commentsList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: commentsList.map((comment) {
            final index = commentsList.indexOf(comment);
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage:
                            AssetImage('assets/images/person1.jpeg'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          "${comment.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: StyleUtil.style14BlackBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${comment.email}",
                    style: StyleUtil.style14Blue,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${comment.body}",
                    style: StyleUtil.style14Black,
                  ),
                  if (index != commentsList.length - 1)
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      height: 1,
                      width: double.infinity,
                      color: ColorUtil.colorBlack45,
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
