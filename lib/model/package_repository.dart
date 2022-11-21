import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class PackageRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getPackageListData(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.get(AppUrl.package_list, data: map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getPackageDetailData(String package_id) async {
    NewAPIResponse response = await _netoworkService.get(
      AppUrl.package_details + "/${package_id}",
    );
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }
}
