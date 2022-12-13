import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class SubscriberRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getSubscriberListData(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.subscriber_list, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getOnlineSubscriberListData(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.online_subscriber_list, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getSubscriberDetailData(String map) async {
    NewAPIResponse response = await _netoworkService.get(
      AppUrl.subscriber_details + "/${map}",
    );
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> addSubscriberDetailData(Map map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.subscriber_details, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }
}
