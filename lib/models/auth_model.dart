import 'dart:convert';

class SocialAuthModel {
  final String authToken;
  final String channel;

  SocialAuthModel({this.authToken, this.channel});

  factory SocialAuthModel.fromCSV(String strCSV) {
    List<String> socialAuthModel = strCSV.split(new RegExp(',\\s+'));
    return new SocialAuthModel(
        authToken: socialAuthModel[0], channel: socialAuthModel[1]);
  }

  factory SocialAuthModel.fromRegisterUser(SocialAuthModel socialAuthModel) {
    return new SocialAuthModel(
        authToken: socialAuthModel.authToken, channel: socialAuthModel.channel);
  }

  factory SocialAuthModel.fromJson(Map<String, dynamic> json) =>
      SocialAuthModel(
          authToken: json["authToken"] == null ? null : json["authToken"],
          channel: json["channel"] == null ? null : json["channel"]);

  Map<String, dynamic> toJson() => {
    // "authToken": authToken == null ? null : authToken,
    // "channel": channel == null ? null : channel,
    "token": authToken == null ? null : authToken,
    "type": channel == null ? null : channel,
  };
}

class LogoutResponseModel {
  final int status;
  final String result;
  final String message;

  LogoutResponseModel({this.message, this.result, this.status});

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      LogoutResponseModel(
        status: json["status"] == null ? null : json["status"],
        result: json["result"] == null ? null : json["result"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "result": result == null ? null : result,
    "message": message == null ? null : message,
  };
}