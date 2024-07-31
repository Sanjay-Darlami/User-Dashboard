import 'dart:convert';
import 'dart:io';

import 'package:demo_project/models/response/api_response.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  Future<ApiResponse?> getData(String endpoint) async {
    ApiResponse? apiResponse;

    try {
      final response = await http.get(Uri.parse(endpoint));
      final decodedJson = jsonDecode(response.body);
      apiResponse = ApiResponse(
        statusCode: response.statusCode,
        message: "Successful response",
        data: decodedJson,
      );
      return apiResponse;
    } on SocketException {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'Network error. Please try again later.',
        data: null,
      );
      return apiResponse;
    } catch (e) {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'An unexpected error occurred.',
        data: null,
      );
      return apiResponse;
    }
  }

  Future<ApiResponse?> postData(
      String endpoint, Map<String, dynamic> data) async {
    ApiResponse? apiResponse;

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      apiResponse = ApiResponse(
        statusCode: response.statusCode,
        message: "Successful response",
        data: response.body,
      );
      return apiResponse;
    } catch (e) {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'An unexpected error occurred.',
        data: null,
      );
      return apiResponse;
    }
  }
}
