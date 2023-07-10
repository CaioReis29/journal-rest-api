/// Gera dia da semana em português
class WeekDay {
  DateTime date;
  late String short;
  late String long;

  WeekDay(this.date) {
    int weekday = date.weekday;
    switch (weekday) {
      case 7:
        short = "Dom";
        long = "Domingo";
        break;
      case 1:
        short = "Seg";
        long = "Segunda-Feira";
        break;
      case 2:
        short = "Ter";
        long = "Terça-Feira";
        break;
      case 3:
        short = "Qua";
        long = "Quarta-Feira";
        break;
      case 4:
        short = "Qui";
        long = "Quinta-Feira";
        break;
      case 5:
        short = "Sex";
        long = "Sexta-Feira";
        break;
      case 6:
        short = "Sab";
        long = "Sábado";
        break;
    }
  }
  
  @override
  String toString() {
    return "${long.toLowerCase()}, ${date.day} / ${date.month}/ ${date.year}";
  }
}
