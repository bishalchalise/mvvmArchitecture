import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/view/screens/home_screen.dart';
import 'package:mvvm/view/screens/login_screen.dart';
import 'package:mvvm/view/screens/register_screen.dart';
import 'package:mvvm/view/screens/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRotue(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RouteNames.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());
       case RouteNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()); 
         case RouteNames.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen()); 


      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No Routes Defined")),
          );
        });
    }
  }
}
