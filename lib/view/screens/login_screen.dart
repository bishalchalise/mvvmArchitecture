import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.register);
                },
                child: const Text("This is Login Screen"))),
      ),
    );
  }
}
