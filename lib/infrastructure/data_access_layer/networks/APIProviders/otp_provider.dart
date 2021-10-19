import 'package:get/get_connect.dart';
import 'package:demoapp/infrastructure/commons/constants/app_constants.dart';
import 'package:demoapp/infrastructure/models/responses/otp_response_model.dart';

abstract class IOtpProvider {
  Future<Response<OtpResponseModel>> getOtpResponse(String path, String requestJson);
}

class OtpProvider extends GetConnect implements IOtpProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => OtpResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = '${AppConstants.baseUrl}';
  }

  @override
  Future<Response<OtpResponseModel>> getOtpResponse(String path, String requestJson) {
   return post(path, requestJson);
  }
}