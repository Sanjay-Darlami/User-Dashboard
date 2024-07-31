import 'package:demo_project/apis/endpoints.dart';
import 'package:demo_project/apis/http_service.dart';
import 'package:demo_project/models/response/api_response.dart';
import 'package:demo_project/models/todos/todos.dart';
import 'package:flutter/foundation.dart';

class TodosProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  List<Todos>? _todostList;
  List<Todos>? get todostList => _todostList;

  fetchUserTodosList(int userId) async {
    String url = "$usersUrl/$userId/todos";
    final ApiResponse? apiResponse = await _httpService.getData(url);
    if (apiResponse!.statusCode == 200) {
      _todostList = [];
      for (var item in apiResponse.data) {
        _todostList!.add(Todos.fromJson(item));
      }
      notifyListeners();
    }
  }
}
