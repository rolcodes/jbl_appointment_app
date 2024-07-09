import 'individual_bar_small.dart';

class BarDataSmall {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarDataSmall({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBarSmall> barData = [];

  // initialize bar data
  void initializedBarData() {
    barData = [
      // sunday
      IndividualBarSmall(x: 0, y: sunAmount),
      // monday
      IndividualBarSmall(x: 1, y: monAmount),
      // tuesday
      IndividualBarSmall(x: 2, y: tueAmount),
      // wednesday
      IndividualBarSmall(x: 3, y: wedAmount),
      // thursday
      IndividualBarSmall(x: 4, y: thurAmount),
      // friday
      IndividualBarSmall(x: 5, y: friAmount),
      // saturday
      IndividualBarSmall(x: 6, y: satAmount),
    ];
  }
}
