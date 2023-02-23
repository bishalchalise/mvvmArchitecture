import 'package:flutter/material.dart';

import 'package:mvvm/res/colors.dart';

class RoundBotton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundBotton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.bottonColor,
          borderRadius: BorderRadius.circular(8.0),
          //  boxShadow:
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                  
                  color: AppColors.whiteColor,)
                : const Text(
                    'Login',
                    style: TextStyle(color: AppColors.whiteColor),
                  )),
      ),
    );
  }
}
