import 'package:desafio/app/core/ui/colors_constants.dart';
import 'package:flutter/material.dart';

class XpButton extends StatelessWidget {
  final Function()? onTap;

  final String text;

  const XpButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorsConstants.brown),
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ));
  }
}
