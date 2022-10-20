import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class DashboardRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getDashboardData(dynamic map) async {
    NewAPIResponse response = await _netoworkService.get(AppUrl.dashboard);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }



}
