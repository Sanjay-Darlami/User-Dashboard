import 'package:demo_project/apis/endpoints.dart';
import 'package:demo_project/apis/http_service.dart';
import 'package:demo_project/models/response/api_response.dart';
import 'package:demo_project/models/user/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  List<User>? _userList;
  List<User>? get userList => _userList;

  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;

  updateRefreshing(bool value) {
    _isRefreshing = value;
    notifyListeners();
  }

  fetchUserList() async {
    updateRefreshing(true);
    final ApiResponse? apiResponse = await _httpService.getData(usersUrl);
    if (apiResponse!.statusCode == 200) {
      _userList = [];
      for (var item in apiResponse.data) {
        _userList!.add(User.fromJson(item));
      }
      notifyListeners();
    }
    updateRefreshing(false);
  }
}
