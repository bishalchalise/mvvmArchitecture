import 'package:flutter/material.dart';

import '../../utils/routes/route_names.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: InkWell(
                onTap: () {
                   Navigator.pushNamed(context, RouteNames.home);
                }, child: const Text("This is Register Screen"))),
      ),
    );
  }
}
