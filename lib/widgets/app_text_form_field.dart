import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  String label;
  String hint;
  bool obscureText;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  Brightness keyboardAppearance;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode focusNext;

  AppTextFormField(
    this.label,
    this.hint, {
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.keyboardAppearance,
    this.textInputAction,
    this.focusNode,
    this.focusNext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (focusNext != null) {
          FocusScope.of(context).requestFocus(focusNext);
        }
      },
    );
  }
}
