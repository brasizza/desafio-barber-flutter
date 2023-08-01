import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CardSemanaController {
  final List<String> weekNames = [];
  final List<String> selectedWeeks = [];

  final String locale;

  CardSemanaController({this.locale = 'pt_BR'});
  void getWeekDays() {
    initializeDateFormatting(locale);
    Intl.defaultLocale = locale;

    DateFormat format = DateFormat.E();
    for (int i = DateTime.monday; i <= DateTime.sunday; i++) {
      DateTime date = DateTime(DateTime.now().year, DateTime.now().month, i - 1);
      String shortName = format.format(date);
      weekNames.add(shortName.toUpperCase().replaceAll('.', ''));
    }
  }

  void setWeek(String week) {
    if (selectedWeeks.contains(week)) {
      selectedWeeks.remove(week);
    } else {
      selectedWeeks.add(week);
    }
  }
}
