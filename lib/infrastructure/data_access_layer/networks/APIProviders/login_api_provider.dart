import 'package:get/get_connect.dart';
import 'package:demoapp/infrastructure/commons/constants/app_constants.dart';
import 'package:demoapp/infrastructure/models/responses/login_response_model.dart';

abstract class ILoginProvider {
  Future<Response<LoginResponseModel>> getCases(String path, String loginRequestJson);
}

class LoginProvider extends GetConnect implements ILoginProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => LoginResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = "${AppConstants.baseUrl}";
  }

  @override
  Future<Response<LoginResponseModel>> getCases(String path, String loginRequestJson) => post(path, loginRequestJson, headers: {"Content-type" : "application/json"});
}