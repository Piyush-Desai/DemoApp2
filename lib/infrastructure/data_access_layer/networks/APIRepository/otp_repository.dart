import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/otp_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/repository_adapter.dart';
import 'package:demoapp/infrastructure/models/responses/otp_response_model.dart';

class OtpRepository implements IOtpRepository {
  OtpRepository({required this.provider});
  final IOtpProvider provider;

  @override
  Future<OtpResponseModel> getOtpResponse(String otpRequestJson) async {
    try {
      final cases = await provider.getOtpResponse("/users/getcode",otpRequestJson);
      if (cases.status.hasError) {
        return Future.error(cases.statusText!);
      } else {
        return cases.body!;
      }
    } catch (e) {
      throw e;
    }
  }
}
