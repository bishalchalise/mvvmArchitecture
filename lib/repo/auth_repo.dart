import 'package:mvvm/data/network/base_api_service.dart';
import 'package:mvvm/data/network/network_api_sservice.dart';
import 'package:mvvm/res/app_urls.dart';

class AuthRepo {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostResponse(AppEndPoints.loginEndPoint, data);
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostResponse(
          AppEndPoints.registerEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
