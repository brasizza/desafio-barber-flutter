import 'package:desafio/app/core/ui/colors_constants.dart';
import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function(String) callback;
  final double width;
  final double height;
  const SelectableButton({super.key, required this.text, required this.selected, required this.callback, this.width = 40, this.height = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () => callback(text),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsConstants.greyLight,
                  width: 2,
                ),
                color: (selected) ? ColorsConstants.brown : null,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            // bac: (selected ? OutlinedButton.styleFrom(backgroundColor: const Color(0xffb47c05)) : null),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: (selected ? Colors.white : ColorsConstants.grey), fontSize: 10),
              ),
            )),
      ),
    );
  }
}
