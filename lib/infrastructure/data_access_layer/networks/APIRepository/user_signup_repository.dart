import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/user_signup_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/repository_adapter.dart';
import 'package:demoapp/infrastructure/models/responses/user_registration_response_model.dart';

class UserSignUpRepository implements IUserSignUpRepository {
  UserSignUpRepository({required this.provider});
  final IUserSignUpProvider provider;

  @override
  Future<UserRegistrationResponseModel> getRegistrationResponse(String userRequestJson) async {
    final cases = await provider.getRegistrationResponse("/users", userRequestJson);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}
