import 'package:desafio/app/core/widgets/xp_button.dart';
import 'package:desafio/app/modules/home/widgets/card_horario/card_horario_controller.dart';
import 'package:desafio/app/modules/home/widgets/card_semana/card_semana_controller.dart';
import 'package:desafio/app/modules/home/widgets/content_confirmacao_dialog.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/xp_text_field.dart';
import 'widgets/card_horario/card_horario_page.dart';
import 'widgets/card_semana/card_semana_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CardSemanaController semanaController;
  late final CardHorarioController horarioController;

  final nomeEC = TextEditingController();
  final emailEC = TextEditingController();

  @override
  void dispose() {
    nomeEC.dispose();
    emailEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    semanaController = CardSemanaController(locale: 'pt_BR')..getWeekDays();

    DateTime initialHour = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0, 0); // Replace this with your specific DateTime

    horarioController = CardHorarioController()..getHours(initialHour, hoursToIncrement: 23, incrementation: 30);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text('Controlador estabelecimento', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: XpTextField(
                controller: nomeEC,
                hintText: 'Nome',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: XpTextField(
                controller: emailEC,
                hintText: 'Email',
              ),
            ),
            CardSemanaPage(controller: semanaController),
            CardHorarioPage(controller: horarioController),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: XpButton(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirmação do establecimento'),
                          content: ContentConfirmacaoDialog(weeks: semanaController.selectedWeeks, hours: horarioController.selectedHours, name: nomeEC.text, email: emailEC.text),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Confirmar'),
                              onPressed: () {
                                emailEC.clear();
                                nomeEC.clear();
                                setState(() {
                                  semanaController.selectedWeeks.clear();
                                  horarioController.selectedHours.clear();
                                });

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  text: 'Cadastrar estabelecimento'),
            ),
          ],
        ),
      ),
    );
  }
}
