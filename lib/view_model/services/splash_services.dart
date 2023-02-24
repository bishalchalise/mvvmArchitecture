

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthStatus(BuildContext context) async {
    getUserData().then((value) async {
     await Future.delayed(const Duration(seconds: 5));
      if (value.token == 'null' || value.token == '') {
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        await Future.delayed(const Duration(seconds: 5));
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
