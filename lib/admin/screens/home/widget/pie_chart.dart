import 'package:appointment_app/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationDuration: const Duration(milliseconds: 750),
      swapAnimationCurve: Curves.easeInOutQuint,
      PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 5,
          centerSpaceRadius: 100,
          sections: [
            // item 1
            PieChartSectionData(
              value: 70,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: TColors.accent),
              color: const Color.fromRGBO(100, 185, 197, 1.0),
            ),

            // item 2
            PieChartSectionData(
              value: 100,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: TColors.accent),
              color: const Color.fromRGBO(300, 210, 128, 1.0),
            ),

            // item 3
            PieChartSectionData(
              value: 50,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: TColors.accent),
              color: const Color.fromRGBO(255, 100, 128, 1.0),
            ),

            // item 4
            PieChartSectionData(
              value: 40,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: TColors.accent),
              color: const Color.fromRGBO(255, 210, 200, 1.0),
            ),
          ]),
    );
  }
}
