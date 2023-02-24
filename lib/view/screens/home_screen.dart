import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Home Screen'),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  userPref.logOut().then((value) {
                    Navigator.pushNamed(context, RouteNames.login);
                  });
                },
                child: const Icon(
                  Icons.logout_rounded,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
