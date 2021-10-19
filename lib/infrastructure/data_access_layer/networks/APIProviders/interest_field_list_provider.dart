import 'package:get/get_connect.dart';
import 'package:demoapp/infrastructure/commons/constants/app_constants.dart';
import 'package:demoapp/infrastructure/models/responses/interest_field_list_model.dart';

abstract class IInterestFieldListProvider {
  Future<Response<InterestFieldResponseModel>> getIInterestFieldListResponse(
    String path,
  );
}

class InterestFieldListProvider extends GetConnect
    implements IInterestFieldListProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) =>InterestFieldResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = '${AppConstants.baseUrl}';
  }

  @override
  Future<Response<InterestFieldResponseModel>> getIInterestFieldListResponse(
          String path) => get(path);
}
