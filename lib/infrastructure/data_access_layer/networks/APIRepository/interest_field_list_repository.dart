import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/interest_field_list_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/repository_adapter.dart';
import 'package:demoapp/infrastructure/models/responses/interest_field_list_model.dart';

class InterestFieldListRepository implements IInterestFieldListRepository {
  InterestFieldListRepository({required this.provider});
  final IInterestFieldListProvider provider;

  @override
  Future<InterestFieldResponseModel> getInterestFieldListResponse() async {

      final cases = await provider.getIInterestFieldListResponse("/fields");
      if (cases.status.hasError) {
            return Future.error(cases.statusText!);
          } else {
            return cases.body!;
          }
  }
}
