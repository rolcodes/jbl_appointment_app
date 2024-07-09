enum Week { weekDay, weekEnd }

class TimeClass {
  const TimeClass({
    required this.time,
    required this.id,
    required this.week,
  });

  final String id;
  final String time;
  final Week week;

}