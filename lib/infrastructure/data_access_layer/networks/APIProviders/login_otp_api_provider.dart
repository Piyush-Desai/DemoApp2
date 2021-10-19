import 'package:get/get_connect.dart';
import 'package:demoapp/infrastructure/commons/constants/app_constants.dart';
import 'package:demoapp/infrastructure/models/responses/login_verify_response_model.dart';

abstract class ILoginOTPProvider {
  Future<Response<LoginVerifyResponseModel>> getCases(String path, String loginRequestJson);
}

class LoginOTPProvider extends GetConnect implements ILoginOTPProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => LoginVerifyResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = "${AppConstants.baseUrl}";
  }

  @override
  Future<Response<LoginVerifyResponseModel>> getCases(String path, String loginRequestJson) => post(path, loginRequestJson, headers: {"Content-type" : "application/json"});
}