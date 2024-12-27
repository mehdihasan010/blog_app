import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String bottonText;
  final String routeName;
  const AuthGradientButton(
      {super.key, required this.bottonText, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppPallete.gradient1,
            AppPallete.gradient2,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, routeName);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: AppPallete.transparentColor,
            shadowColor: AppPallete.transparentColor,
            side: BorderSide.none,
          ),
          child: Text(
            bottonText,
            style: const TextStyle(
              color: AppPallete.textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
