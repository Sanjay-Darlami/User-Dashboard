import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  final TabBar? tabBar;

  const CustomAppbar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.showBackButton = true,
    this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: ColorUtil.colorWhite,
      toolbarHeight: kToolbarHeight,
      title: Text(
        '$title',
        style: StyleUtil.style16DarkBlueBold,
      ),
      leading: showBackButton
          ? Container(
              margin: const EdgeInsets.only(left: 24.0),
              child: CircleAvatar(
                backgroundColor: ColorUtil.colorLightBlue,
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: ColorUtil.colorWhite,
                    size: 16,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          : Container(
              margin: const EdgeInsets.only(left: 24.0),
              child: CircleAvatar(
                backgroundColor: ColorUtil.colorLightBlue,
                child: IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: ColorUtil.colorWhite,
                    size: 16,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
      actions: actions,
      backgroundColor: ColorUtil.colorWhite,
      bottom: tabBar,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (tabBar?.preferredSize.height ?? 0.0),
      );
}
