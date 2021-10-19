import 'package:get/get_connect.dart';
import 'package:demoapp/infrastructure/commons/constants/app_constants.dart';
import 'package:demoapp/infrastructure/models/responses/log_out_response_model.dart';

abstract class ILogOutProvider {
  Future<Response<LogOutResponseModel>> getLogout(String path, String logOutRequestJson);
}

class LogOutProvider extends GetConnect implements ILogOutProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => LogOutResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = "${AppConstants.baseUrl}";
  }

  @override
  Future<Response<LogOutResponseModel>> getLogout(String path, String loginRequestJson) => post(path, loginRequestJson, headers: {"Content-type" : "application/json"});
}