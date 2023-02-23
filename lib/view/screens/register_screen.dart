import 'package:flutter/material.dart';

import '../../utils/routes/route_names.dart';
import '../../utils/utils.dart';

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
                  // Utils.toastMessgae("No Such Pages");
                  Utils.flushMessage(context, "Sorry No Such Page Exists");
                  Utils.snackBar(context, 'Unable to process the request');

                  //  Navigator.pushNamed(context, RouteNames.home);
                },
                child: const Text("This is Register Screen"))),
      ),
    );
  }
}
