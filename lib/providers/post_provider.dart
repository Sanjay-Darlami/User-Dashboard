import 'dart:async';

import 'package:demo_project/apis/endpoints.dart';
import 'package:demo_project/apis/http_service.dart';
import 'package:demo_project/models/post/comments.dart';
import 'package:demo_project/models/post/post.dart';
import 'package:demo_project/models/response/api_response.dart';
import 'package:demo_project/providers/preferences_provider.dart';
import 'package:flutter/foundation.dart';

class PostProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();
  final PreferencesProvider preferencesProvider;

  PostProvider(this.preferencesProvider);

  List<Post>? _postList;
  List<Post>? get postList => _postList;

  fetchUserPostList(int userId) async {
    List<Post>? savedPosts = await preferencesProvider.retrievePosts(userId);
    if (savedPosts != null) {
      _postList = savedPosts;
      notifyListeners();
      return;
    }
    String url = "$usersUrl/$userId/posts";
    final ApiResponse? apiResponse = await _httpService.getData(url);
    if (apiResponse!.statusCode == 200) {
      _postList = [];
      for (var item in apiResponse.data) {
        _postList!.add(Post.fromJson(item));
      }
      await preferencesProvider.savePosts(userId, _postList!);
      notifyListeners();
    }
  }

  List<Comments>? _commentsList;
  List<Comments>? get commentsList => _commentsList;

  fetchUserPostCommentsList(int postId) async {
    _commentsList = null;
    notifyListeners();
    String url = "$postsUrl/$postId/comments";
    final ApiResponse? apiResponse = await _httpService.getData(url);
    if (apiResponse!.statusCode == 200) {
      _commentsList = [];
      for (var item in apiResponse.data) {
        _commentsList!.add(Comments.fromJson(item));
      }
      notifyListeners();
    }
  }

  postUserComments(int postId, Map<String, dynamic> data) async {
    String url = "https://jsonplaceholder.typicode.com/posts//$postId/comments";
    final ApiResponse? apiResponse = await _httpService.postData(url, data);
    if (apiResponse!.statusCode == 200) {}
  }

  bool _isPostingComment = false;
  bool get isPostingcomment => _isPostingComment;

  updatePostingComment(bool value) {
    _isPostingComment = value;
    notifyListeners();
  }

  Future<bool> postUserComment(int postId, Map<String, dynamic> data) async {
    Completer<bool> completer = Completer<bool>();
    updatePostingComment(true);
    String url = "https://jsonplaceholder.typicode.com/posts//$postId/comments";
    final ApiResponse? apiResponse = await _httpService.postData(url, data);
    if (apiResponse!.statusCode == 200 || apiResponse.statusCode == 201) {
      completer.complete(true);
    } else {
      completer.complete(false);
    }
    updatePostingComment(false);
    return completer.future;
  }
}
