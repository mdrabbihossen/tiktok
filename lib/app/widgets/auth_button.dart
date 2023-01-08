import 'package:flutter/material.dart';
import 'package:tiktok/app/utils/colors.dart';

class AuthButton extends StatelessWidget {
  final Size size;
  final String authText;
  final VoidCallback onPress;

  const AuthButton({
    Key? key,
    required this.size,
    required this.authText,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.buttonColor,
        minimumSize: Size(
          size.width - 40,
          size.height * 0.07,
        ),
      ),
      onPressed: onPress,
      child: Text(
        authText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
