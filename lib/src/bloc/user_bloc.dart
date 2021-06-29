import 'package:flutter_app/src/model/base_response.dart';
import 'package:flutter_app/src/model/users_response.dart';
import 'package:flutter_app/src/services/api_client.dart';
import 'package:flutter_app/src/services/api_constant.dart';
import 'package:flutter_app/src/services/db/hive_service.dart';
import 'package:flutter_app/src/utils/connectivity_checker.dart';
import 'package:flutter_app/src/utils/error_handler.dart';
import 'package:flutter_app/src/utils/strings.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final String boxName = "users";

  final userData = PublishSubject<List<UsersResponse>>();

  Stream<List<UsersResponse>> get users => userData.stream;

  getUserFromCached(int page) async {
    List<UsersResponse> userList = await HiveService.instance.getBoxes<UsersResponse>(boxName);
    if (userList != null && userList.isNotEmpty) {
      userData.sink.add(userList);
    }
    userData.addError(Exception("No data found"));
  }

  getUserFromNetwork(int page) async {
    var params = {ApiConstant.PAGE: page, ApiConstant.PER_PAGE: 5};
    ApiResponse response = await ApiClient.instance.call(url: ApiConstant.ENDPOINT_USERS, params: params);
    if (response is BaseResponse) {
      var userList = UsersResponse.fromJson(response.data);
      if (page == 1) {
        await HiveService.instance.clear(boxName);
      }
      if (userList != null && userList.isNotEmpty) {
        await HiveService.instance.addBoxes<UsersResponse>(userList, boxName);
        userData.sink.add(userList);
      } else {
        userData.sink.add(null);
        userData.addError(Exception(Strings.errorNoDataAvailable));
      }
    }
    if (response is ErrorResponse) {
      userData.addError(Exception(response.errorMessage ??
          ErrorHandler.getErrorMessage(response.statusCode) ??
          Strings.errorWhileFetchingData));
    }
  }

  fetchUsers(int page) async {
    if (await ConnectivityChecker.isConnectionAvailable()) {
      await getUserFromNetwork(page);
    } else {
      await getUserFromCached(page);
    }
  }

  dispose() {
    userData.close();
  }
}
