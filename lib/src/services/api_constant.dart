enum Environment { DEV, STAGING, PROD }

class ApiConstant {
  static const Environment appEnv = Environment.DEV;

  static const API_URL = "https://reqres.in/api/";

  static const PAGE = "page";

  static const PER_PAGE = "per_page";

  static String getApiEnvLabel() {
    if (appEnv == Environment.DEV) {
      return "test";
    } else if (appEnv == Environment.STAGING) {
      return "staging";
    } else {
      return "";
    }
  }

  //Endpoint
  static const ENDPOINT_USERS = "users";
}
