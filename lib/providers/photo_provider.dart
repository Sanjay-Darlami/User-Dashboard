import 'package:demo_project/apis/endpoints.dart';
import 'package:demo_project/apis/http_service.dart';
import 'package:demo_project/models/albums/album.dart';
import 'package:demo_project/models/albums/photos.dart';
import 'package:demo_project/models/response/api_response.dart';
import 'package:flutter/foundation.dart';

class PhotoProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  List<Album>? _albumList;
  List<Album>? get albumList => _albumList;

  fetchUserAlbumList(int userId) async {
    String url = "$usersUrl/$userId/albums";
    final ApiResponse? apiResponse = await _httpService.getData(url);
    if (apiResponse!.statusCode == 200) {
      _albumList = [];
      for (var item in apiResponse.data) {
        _albumList!.add(Album.fromJson(item));
      }
      notifyListeners();
    }
  }

  List<Photos>? _photosList;
  List<Photos>? get photosList => _photosList;

  fetchUserPhotosList(int albumId) async {
    String url = "$usersUrl/$albumId/photos";
    final ApiResponse? apiResponse = await _httpService.getData(url);
    if (apiResponse!.statusCode == 200) {
      _photosList = [];
      for (var item in apiResponse.data) {
        _photosList!.add(Photos.fromJson(item));
      }
      notifyListeners();
    }
  }
}
