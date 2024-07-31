import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/widgets/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PhotoShimmer extends StatelessWidget {
  const PhotoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BuildPhotoShimmer(),
          CustomVerticalSpacer(),
          BuildPhotoShimmer(),
          CustomVerticalSpacer(),
          BuildPhotoShimmer(),
        ],
      ),
    );
  }
}

class BuildPhotoShimmer extends StatelessWidget {
  const BuildPhotoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: ColorUtil.colorBlack,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 8,
                width: double.infinity,
                color: ColorUtil.colorBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
