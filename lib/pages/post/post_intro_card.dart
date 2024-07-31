import 'package:demo_project/models/post/post.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class PostIntroCard extends StatelessWidget {
  final Post post;
  const PostIntroCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    post.title!,
                    style: StyleUtil.style16DarkBlueBold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              post.body!,
              style: StyleUtil.style14Black,
            ),
          ],
        ),
      ),
    );
  }
}
