abstract class ApiResponse {
  ApiResponse();

  factory ApiResponse.success(json) => BaseResponse.fromJson(json);

  factory ApiResponse.error({int statusCode, String errorMessage}) =>
      ErrorResponse(statusCode: statusCode, errorMessage: errorMessage);
}

class BaseResponse extends ApiResponse {
  dynamic data;

  BaseResponse({this.data});

  factory BaseResponse.fromJson(json) {
    return BaseResponse(data: json['data']);
  }
}

class ErrorResponse extends ApiResponse {
  int statusCode;
  String errorMessage;

  ErrorResponse({this.statusCode, this.errorMessage});
}
