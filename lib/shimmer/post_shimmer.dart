import 'package:demo_project/widgets/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BuildPostShimmer(),
          CustomVerticalSpacer(),
          BuildPostShimmer(),
          CustomVerticalSpacer(),
          BuildPostShimmer(),
          CustomVerticalSpacer(),
          BuildPostShimmer(),
          CustomVerticalSpacer(),
        ],
      ),
    );
  }
}

class BuildPostShimmer extends StatelessWidget {
  const BuildPostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const CircleAvatar(
                    radius: 16,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 12,
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 24,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
