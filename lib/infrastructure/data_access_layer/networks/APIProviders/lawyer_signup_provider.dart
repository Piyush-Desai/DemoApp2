import 'package:get/get_connect.dart';
import 'package:demoapp/infrastructure/commons/constants/app_constants.dart';
import 'package:demoapp/infrastructure/models/responses/registration_response_model.dart';

abstract class ILawyerSignupProvider {
  Future<Response<RegistrationResponseModel>> getRegistrationResponse(String path, String reuestJson);
}

class LawyerSignupProvider extends GetConnect implements ILawyerSignupProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => RegistrationResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = '${AppConstants.baseUrl}';
  }

  @override
  Future<Response<RegistrationResponseModel>> getRegistrationResponse(String path, String reuestJson) => post(path, reuestJson);
}