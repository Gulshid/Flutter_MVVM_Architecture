

import 'package:mvvm_architecture/Data/Network/BaseApi_response.dart';
import 'package:mvvm_architecture/Data/Network/NetworkApi_Services.dart';
import 'package:mvvm_architecture/Resources/Compponent/app_url.dart';

class AuthRepos {
  BaseapiServices _apiServices = NetworkapiServices();

  Future<dynamic> login_api(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostapiResponse(
        AppUrl.loginEndPoint,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }


   Future<dynamic> SignUp_api(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostapiResponse(
        AppUrl.RegisterapiEndPoint,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}




