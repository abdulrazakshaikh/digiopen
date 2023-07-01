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

  Future<NewAPIResponse> addPackageDetailData(Map map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.package_details, map);
    return response!;
  }

  Future<NewAPIResponse> updatePackageDetailData(
      String subscriberId, Map map) async {
    NewAPIResponse response = await _netoworkService.patch(
        AppUrl.package_details + "/$subscriberId", map);
    return response!;
  }

  Future<NewAPIResponse> deletePackageDetailData(
      String subscriberId, Map map) async {
    NewAPIResponse response = await _netoworkService.delete(
        AppUrl.package_details + "/$subscriberId", map);
    return response!;
  }
}
