import 'package:desafio/app/core/widgets/selectable_button.dart';
import 'package:desafio/app/modules/home/widgets/card_semana/card_semana_controller.dart';
import 'package:flutter/material.dart';

class CardSemanaPage extends StatefulWidget {
  final CardSemanaController controller;
  const CardSemanaPage({super.key, required this.controller});

  @override
  State<CardSemanaPage> createState() => _CardSemanaPageState();
}

class _CardSemanaPageState extends State<CardSemanaPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
            child: Text(
              'Selecione os dias da semana',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.controller.weekNames.length,
                itemBuilder: (context, index) {
                  final String week = widget.controller.weekNames[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: SelectableButton(
                      callback: (String week) {
                        setState(() {
                          widget.controller.setWeek(week);
                        });
                      },
                      text: week,
                      selected: (widget.controller.selectedWeeks.contains(week)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
