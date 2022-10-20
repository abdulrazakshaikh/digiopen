import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class AuthRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getUserLogin(dynamic map) async {
    NewAPIResponse response = await _netoworkService.post(AppUrl.login, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }
  Future<NewAPIResponse> getUserLocationAccess(dynamic map) async {
    NewAPIResponse response = await _netoworkService.get(AppUrl.listOfLocation);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }


}
