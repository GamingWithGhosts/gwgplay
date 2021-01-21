import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gwgplay/models/auth_model.dart';

class AuthService {
  Future<Response> login(SocialAuthModel socialAuth) async {
    var client = Dio(BaseOptions(baseUrl: "https://gamingwithghosts.com"));

    try {
      print("in auth service");
      FormData formData = new FormData.fromMap(socialAuth.toJson());
      // Response response = await client.post(
      //   "/social-auth",
      //   data: formData,
      // );
      // Fake the API call till the API is ready
      Response response = new Response(data: {"token": "TestJWT"});
      print("Log in successful! $response");
      return response;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return Response();
    }
  }
}