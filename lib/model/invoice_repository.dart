import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class InvoiceRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getInvoiceListData(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.invoice_list, map);
    return response!;
  }

  Future<NewAPIResponse> getInvoiceDetailData(String map) async {
    NewAPIResponse response = await _netoworkService.get(
      AppUrl.invoice_details + "/${map}",
    );
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> addInvoiceDetailData(Map map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.invoice_details, map);
    return response!;
  }

  Future<NewAPIResponse> updateInvoiceDetailData(
      String subscriberId, Map map) async {
    NewAPIResponse response = await _netoworkService.patch(
        AppUrl.invoice_details + "/$subscriberId", map);
    return response!;
  }
}
