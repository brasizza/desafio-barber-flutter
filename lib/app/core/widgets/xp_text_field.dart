import 'package:desafio/app/core/ui/colors_constants.dart';
import 'package:flutter/material.dart';

class XpTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool validate;
  final String validatorText;
  final String? labelText;
  const XpTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validatorText = '',
    this.validate = true,
    this.labelText,
  });

  @override
  State<XpTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<XpTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (!widget.validate) ? null : (val) => val!.isEmpty ? widget.validatorText : null,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsConstants.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsConstants.grey),
        ),
        fillColor: Colors.white,
        label: Text(widget.hintText),
        labelStyle: const TextStyle(color: ColorsConstants.grey),
        filled: true,
      ),
    );
  }
}
