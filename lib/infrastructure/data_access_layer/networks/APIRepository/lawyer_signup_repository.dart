import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/lawyer_signup_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/repository_adapter.dart';
import 'package:demoapp/infrastructure/models/responses/registration_response_model.dart';

class LawyerSignupRepository implements ILawyerSignUpRepository {
  LawyerSignupRepository({required this.provider});

  final ILawyerSignupProvider provider;

  @override
  Future<RegistrationResponseModel> getRegistrationResponse(
      String lawyerRequestJson) async {
    final cases = await provider.getRegistrationResponse(
        "/users", lawyerRequestJson);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }

}
