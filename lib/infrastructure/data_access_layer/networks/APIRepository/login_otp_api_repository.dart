import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/login_otp_api_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/repository_adapter.dart';
import 'package:demoapp/infrastructure/models/responses/login_verify_response_model.dart';

class LoginOTPAPIRepository implements ILoginVerificationRepository {

  final ILoginOTPProvider provider;

  LoginOTPAPIRepository({required this.provider});


  @override
  Future<LoginVerifyResponseModel> getLoginVerifyAPIResponse(String loginVerifyRequestJson) async {
    final loginVerifyResponseModel = await provider.getCases("/users/login/verify", loginVerifyRequestJson);

    if (loginVerifyResponseModel.status.hasError) {
      return Future.error(loginVerifyResponseModel.statusText!);
    } else {
      return loginVerifyResponseModel.body!;
    }
  }

}