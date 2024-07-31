import 'package:demo_project/models/post/post.dart';
import 'package:demo_project/pages/post/post_detail_page.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(post: post),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      post.title!,
                      style: StyleUtil.style16DarkBlueBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
