import 'package:connectivity/connectivity.dart';

class ConnectivityChecker {
  static isConnectionAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return checkConnection(connectivityResult);
  }

  static checkConnection(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
