class CardHorarioController {
  final List<String> hours = [];
  final List<String> selectedHours = [];

  void getHours(DateTime initialHour, {int hoursToIncrement = 12, int incrementation = 30}) {
    for (int i = 0; i < hoursToIncrement; i++) {
      DateTime incrementedDateTime = initialHour.add(Duration(minutes: incrementation));
      String formattedTime = '${incrementedDateTime.hour}:${incrementedDateTime.minute.toString().padLeft(2, '0')}';
      hours.add(formattedTime);
      initialHour = incrementedDateTime;
    }
  }

  void setHour(String hour) {
    if (selectedHours.contains(hour)) {
      selectedHours.remove(hour);
    } else {
      selectedHours.add(hour);
    }
  }
}
