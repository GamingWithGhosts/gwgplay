import 'package:google_sign_in/google_sign_in.dart';
import 'package:gwgplay/models/auth_model.dart';
import 'package:gwgplay/models/user_model.dart';
import 'package:gwgplay/utils/storage.dart';
import 'package:gwgplay/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
AuthenticatedUser authenticatedUser;

void logOut() {
  if (authenticatedUser.authType == "google") {
    signOutGoogle();
  }
  deleteUserInfo();
}

Future<String> signInWithGoogle() async {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    print(googleSignInAccount.email +
        " " +
        googleSignInAuthentication.accessToken);

    // Checking if email and name is valid
    assert(googleSignInAccount.email != null);
    assert(googleSignInAccount.displayName != null);
    assert(googleSignInAccount.photoUrl != null);

    // Checking if Token is Valid
    assert(googleSignInAuthentication.accessToken != null);

    String _fullName = googleSignInAccount.displayName;
    String _firstName;
    String _lastName;

    // Only taking the first part of the name, i.e., First Name
    if (_fullName.contains(" ")) {
      _firstName = _fullName.substring(0, _fullName.indexOf(" "));
      _lastName = _fullName.substring(1, _fullName.indexOf(" "));
    }

    SocialAuthModel socialAuth = SocialAuthModel.fromCSV(
        googleSignInAuthentication.accessToken + ", google");

    Response response = await AuthService().login(socialAuth);

    authenticatedUser = new AuthenticatedUser(
        googleSignInAccount.displayName,
        _firstName,
        _lastName,
        googleSignInAccount.email,
        googleSignInAccount.photoUrl,
        response.data['token'],
        "google");
    await saveUserInfo(authenticatedUser);
    return 'Login With Google Successful';
  } catch (err) {
    print(err);
    return err.toString();
  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  authenticatedUser = null;
  print("User Logout");
}