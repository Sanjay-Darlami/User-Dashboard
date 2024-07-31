import 'dart:convert';

import 'package:demo_project/models/post/post.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> savePosts(int userId, List<Post> posts) async {
    final prefs = await _prefs;
    final postsJson = jsonEncode(posts.map((post) => post.toJson()).toList());
    await prefs.setString(userId.toString(), postsJson);
  }

  Future<List<Post>?> retrievePosts(int userId) async {
    final prefs = await _prefs;
    final postsJson = prefs.getString(userId.toString());
    if (postsJson == null) {
      return null;
    }
    final List<dynamic> decodedPosts = jsonDecode(postsJson);
    return decodedPosts.map((json) => Post.fromJson(json)).toList();
  }

  Future<void> clearPosts(int userId) async {
    final prefs = await _prefs;
    await prefs.remove(userId.toString());
    notifyListeners();
  }
}
