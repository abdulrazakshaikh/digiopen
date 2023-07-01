import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class PaymentRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getPaymentListData(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.payment_list, map);
    return response!;
  }

  Future<NewAPIResponse> getPaymentDetailData(String map) async {
    NewAPIResponse response = await _netoworkService.get(
      AppUrl.payment_details + "/${map}",
    );
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> addPaymentDetailData(Map map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.payment_details, map);
    return response!;
  }

  Future<NewAPIResponse> updatePaymentDetailData(
      String subscriberId, Map map) async {
    NewAPIResponse response = await _netoworkService.patch(
        AppUrl.payment_details + "/$subscriberId", map);
    return response!;
  }
}
