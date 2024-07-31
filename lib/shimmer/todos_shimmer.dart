import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/widgets/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TodosShimmer extends StatelessWidget {
  const TodosShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BuildTodosShimmer(),
          CustomVerticalSpacer(),
          BuildTodosShimmer(),
          CustomVerticalSpacer(),
          BuildTodosShimmer(),
          CustomVerticalSpacer(),
          BuildTodosShimmer(),
          CustomVerticalSpacer(),
          BuildTodosShimmer(),
        ],
      ),
    );
  }
}

class BuildTodosShimmer extends StatelessWidget {
  const BuildTodosShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 4.0, top: 8),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: ColorUtil.colorBlack,
          ),
        ),
      ),
    );
  }
}
