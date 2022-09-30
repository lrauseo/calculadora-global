import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FormTextFieldStandard extends StatelessWidget {
  final bool isPassword;
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final bool readOnly;
  final void Function()? onTap;

  const FormTextFieldStandard({
    Key? key,
    this.isPassword = false,
    required this.controller,
    this.padding,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
    this.decoration,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        readOnly: readOnly,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        decoration: decoration,
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        onTap: onTap,
      ),
    );
  }
}
