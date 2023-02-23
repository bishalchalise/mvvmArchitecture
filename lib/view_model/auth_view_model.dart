import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repo/auth_repo.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final _myRepo = AuthRepo();

  setLoading(bool value) {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
   await _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RouteNames.register);
      Utils.flushMessage(context, "Login Successfull");
     
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
     setLoading(false);
if (kDebugMode) {
    Utils.flushMessage(context, error.toString());
      print(error.toString());
}
    
    });
  }
  
}
