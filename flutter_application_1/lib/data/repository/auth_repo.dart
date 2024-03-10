import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/models/signup_body_model.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  saveUserToken(String token) {
    apiClient.token = token;
  }
}

//8:58:09