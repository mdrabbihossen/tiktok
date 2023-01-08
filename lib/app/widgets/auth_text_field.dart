import 'package:flutter/material.dart';
import 'package:tiktok/app/utils/colors.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;

  final bool showPassword;
  final TextInputType inputType;
  final VoidCallback? showPasswordPressed;
  final String errorText;
  final TextCapitalization capitalization;
final IconData prefixIcon;
  const AuthTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.showPassword = false,
    this.inputType = TextInputType.text,
    this.showPasswordPressed,
    this.errorText = "This field should not be empty",
    this.capitalization = TextCapitalization.sentences,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? !widget.showPassword : false,
      keyboardType: widget.inputType,
      textAlign: TextAlign.center,
      textCapitalization: widget.capitalization,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        prefixIcon: Icon(widget.prefixIcon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color:  AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
