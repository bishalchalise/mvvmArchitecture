import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exception.dart';
import 'package:mvvm/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(
            const Duration(seconds: 10),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}

dynamic returnResponse(http.Response response) async {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Unable to connect to the Internet : ${response.statusCode}');
  }
}
