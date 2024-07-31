import 'package:demo_project/models/user/user.dart';
import 'package:demo_project/pages/home/user_detail_page.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final User user;
  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailPage(user: user),
          ),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/images/person.jpg'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: user.name ?? "",
                            style: StyleUtil.style16DarkBlueBold,
                          ),
                          TextSpan(
                            text: user.username != null
                                ? " (${user.username})"
                                : '',
                            style: StyleUtil.style14DarkBlueBold,
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(user.email ?? "", style: StyleUtil.style14Blue),
                    const SizedBox(height: 4),
                    Text(
                      user.company!.name ?? "",
                      style: StyleUtil.style14Black,
                    ),
                    const SizedBox(height: 4),
                    Text(user.phone ?? ""),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
