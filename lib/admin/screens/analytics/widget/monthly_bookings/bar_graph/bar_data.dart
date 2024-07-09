
import 'individual_bar.dart';

class BarData {
  final double juneBookings;
  final double julyBookings;
  final double augustBookings;
  final double septemberBookings;
  final double novemberBookings;
  final double decemberBookings;

  BarData({
    required this.juneBookings,
    required this.julyBookings,
    required this.augustBookings,
    required this.septemberBookings,
    required this.novemberBookings,
    required this.decemberBookings,
  });

  List<IndividualBar> barData = [];

  // initialize bar data
  void initializedBarData() {
     barData = [
       // june
       IndividualBar(x: 0, y: juneBookings),
       // july
       IndividualBar(x: 1, y: julyBookings),
       // august
       IndividualBar(x: 2, y: augustBookings),
       // september
       IndividualBar(x: 3, y: septemberBookings),
       // october
       IndividualBar(x: 4, y: novemberBookings),
       // november
       IndividualBar(x: 5, y: decemberBookings),

     ];
  }
}
