import 'package:get/get_connect.dart';
import 'package:demoapp/infrastructure/commons/constants/app_constants.dart';
import 'package:demoapp/infrastructure/models/responses/user_registration_response_model.dart';

abstract class IUserSignUpProvider {
  Future<Response<UserRegistrationResponseModel>> getRegistrationResponse(String path, String reuestJson);
}

class UserSignUpProvider extends GetConnect implements IUserSignUpProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => UserRegistrationResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = '${AppConstants.baseUrl}';
  }

  @override
  Future<Response<UserRegistrationResponseModel>> getRegistrationResponse(String path, String requestJson) => post(path, requestJson);
}