import 'package:demo_project/models/user/user.dart';
import 'package:demo_project/pages/photos/album_widget.dart';
import 'package:demo_project/providers/photo_provider.dart';
import 'package:demo_project/shimmer/album_shimmer.dart';
import 'package:demo_project/widgets/custom_empty_widget.dart';
import 'package:demo_project/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatefulWidget {
  final User user;
  const AlbumPage({super.key, required this.user});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: Provider.of<PhotoProvider>(context, listen: false)
            .fetchUserAlbumList(widget.user.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AlbumShimmer();
          } else if (snapshot.hasError) {
            return const CustomErrorWidget(
                errorMessage: "Error fetching albums");
          } else {
            return Consumer<PhotoProvider>(
              builder: (context, photoProvider, child) {
                final albumList = photoProvider.albumList;
                if (albumList == null || albumList.isEmpty) {
                  return const CustomEmptyWidget(message: "No albums found");
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      crossAxisSpacing: 8.0, // Horizontal spacing between items
                      mainAxisSpacing: 8.0, // Vertical spacing between items
                    ),
                    itemCount: albumList.length,
                    itemBuilder: (context, index) {
                      final album = albumList[index];

                      return AlbumWidget(album: album);
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
