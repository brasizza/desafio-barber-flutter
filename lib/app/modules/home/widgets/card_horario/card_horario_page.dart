import 'package:desafio/app/core/widgets/selectable_button.dart';
import 'package:desafio/app/modules/home/widgets/card_horario/card_horario_controller.dart';
import 'package:flutter/material.dart';

class CardHorarioPage extends StatefulWidget {
  final CardHorarioController controller;
  const CardHorarioPage({super.key, required this.controller});

  @override
  State<CardHorarioPage> createState() => _CardHorarioPageState();
}

class _CardHorarioPageState extends State<CardHorarioPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
          child: Text(
            'Selecione os horários de atendimento',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Center(
          child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.controller.hours
                  .map((hour) => SelectableButton(
                      width: 80,
                      height: 30,
                      text: hour,
                      selected: widget.controller.selectedHours.contains(hour),
                      callback: (value) {
                        setState(() {
                          widget.controller.setHour(hour);
                        });
                      }))
                  .toList()),
        )
      ]),
    );
  }
}
