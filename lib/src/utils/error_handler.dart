import 'package:flutter_app/src/services/error_code.dart';
import 'package:flutter_app/src/utils/strings.dart';

class ErrorHandler {
  static String getErrorMessage(int statusCode) {
    if (statusCode != null) {
      switch (statusCode) {
        case ErrorCode.NO_INTERNET_CONNECTION:
          return Strings.errorNoInternetConnection;
        case ErrorCode.CONNECTION_TIMEOUT:
          return Strings.errorTimeout;
        case ErrorCode.SERVER_DOWN:
          return Strings.errorServerDown;
        case ErrorCode.REQUEST_CANCELLED:
          return Strings.errorRequestCancelled;
        default:
          return Strings.errorApiError;
      }
    } else {
      return null;
    }
  }
}
