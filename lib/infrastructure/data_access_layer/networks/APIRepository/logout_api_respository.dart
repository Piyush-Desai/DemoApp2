import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/logout_api_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/repository_adapter.dart';
import 'package:demoapp/infrastructure/models/responses/log_out_response_model.dart';


class LogOutAPIRepository implements ILogoutRepository {

  final ILogOutProvider provider;

  LogOutAPIRepository({required this.provider});

  @override
  Future<LogOutResponseModel> getLogOutResponse(String userId, String logoutRequestJson) async {
    final logOutResponseModel = await provider.getLogout("/users/logout/$userId", logoutRequestJson);

    if (logOutResponseModel.status.hasError) {
      return Future.error(logOutResponseModel.statusText!);
    } else {
      return logOutResponseModel.body!;
    }
  }

}