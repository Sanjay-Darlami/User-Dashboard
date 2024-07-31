import 'package:demo_project/models/albums/album.dart';
import 'package:demo_project/pages/photos/photo_page.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';

class AlbumWidget extends StatelessWidget {
  final Album album;
  const AlbumWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoPage(album: album),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                  "assets/images/background_image.jpg"), // Ensure album.coverImageUrl is a valid URL
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                album.title!,
                textAlign: TextAlign.center,
                style: StyleUtil.style16White,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
