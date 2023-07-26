import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class AccessRequestRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getAccessRequestListData(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.access_request_list, map);
    return response!;
  }

  Future<NewAPIResponse> getDeleteAllAccessRequestListData(dynamic map) async {
    NewAPIResponse response = await _netoworkService.delete(
        AppUrl.delete_all_access_request_list, map);
    return response!;
  }

/*Future<NewAPIResponse> getAccessRequestDetailData(String map) async {
    NewAPIResponse response = await _netoworkService.get(
      AppUrl.payment_details + "/${map}",
    );
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }*/
}
