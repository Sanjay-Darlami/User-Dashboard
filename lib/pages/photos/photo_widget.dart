import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_project/models/albums/photos.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final Photos photo;

  const PhotoWidget({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: CachedNetworkImage(
              imageUrl: photo.url!,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              photo.title!,
              style: StyleUtil.style14Black,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
