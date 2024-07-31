import 'package:demo_project/appbar/custom_appbar.dart';
import 'package:demo_project/models/albums/album.dart';
import 'package:demo_project/pages/photos/photo_widget.dart';
import 'package:demo_project/providers/photo_provider.dart';
import 'package:demo_project/shimmer/photo_shimmer.dart';
import 'package:demo_project/widgets/custom_empty_widget.dart';
import 'package:demo_project/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoPage extends StatefulWidget {
  final Album album;
  const PhotoPage({super.key, required this.album});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: '${widget.album.title}'),
      body: FutureBuilder<void>(
        future: Provider.of<PhotoProvider>(context, listen: false)
            .fetchUserPhotosList(widget.album.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PhotoShimmer();
          } else if (snapshot.hasError) {
            return const CustomErrorWidget(
                errorMessage: "Error fetching photos");
          } else {
            return Consumer<PhotoProvider>(
              builder: (context, photoProvider, child) {
                final photosList = photoProvider.photosList;
                if (photosList == null || photosList.isEmpty) {
                  return const CustomEmptyWidget(
                      message: "No photos available");
                } else {
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      final photo = photosList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: PhotoWidget(photo: photo),
                      );
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
