class ApiResponse {
  int statusCode;
  dynamic data;
  String message;

  ApiResponse({
    required this.statusCode,
    this.data,
    required this.message,
  });
}
