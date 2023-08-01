import 'package:flutter/material.dart';

class ContentConfirmacaoDialog extends StatelessWidget {
  final List<String> weeks;
  final List<String> hours;
  final String email;
  final String name;

  const ContentConfirmacaoDialog({super.key, required this.weeks, required this.hours, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Nome:"),
            Text(name),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("E-mail:"),
            Text(email),
          ],
        ),
        Text("Semanas escolhidas:"),
        Text(weeks.join(',')),
        Text("Horários escolhidos:"),
        Flexible(
          child: Text(hours.join(',')),
        ),
      ],
    );
  }
}
