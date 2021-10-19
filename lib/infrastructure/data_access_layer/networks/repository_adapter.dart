import 'package:demoapp/infrastructure/models/responses/interest_field_list_model.dart';
import 'package:demoapp/infrastructure/models/responses/log_out_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/login_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/login_verify_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/otp_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/registration_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/user_registration_response_model.dart';

abstract class ILoginRepository {
  Future<LoginResponseModel> getLoginAPIResponse(String loginRequestJson);
}

abstract class ILoginVerificationRepository {
  Future<LoginVerifyResponseModel> getLoginVerifyAPIResponse(String loginVerifyRequestJson);
}

abstract class ILawyerSignUpRepository {
  Future<RegistrationResponseModel> getRegistrationResponse(String lawyerRequestJson);
}
abstract class IUserSignUpRepository {
  Future<UserRegistrationResponseModel> getRegistrationResponse(String userRequestJson);
}

abstract class IInterestFieldListRepository {
  Future<InterestFieldResponseModel> getInterestFieldListResponse();
}

abstract class IOtpRepository {
  Future<OtpResponseModel> getOtpResponse(String otpRequestJson);
}

abstract class ILogoutRepository {
  Future<LogOutResponseModel> getLogOutResponse(String userId,String logoutRequestJson);
}
