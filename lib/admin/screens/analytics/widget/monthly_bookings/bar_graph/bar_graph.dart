import 'package:appointment_app/admin/screens/analytics/widget/monthly_bookings/bar_graph/bar_data.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List monthlySummary; // [juneAmount, JulyAmount,..., novemberAmount]
  const MyBarGraph({super.key, required this.monthlySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      juneBookings: monthlySummary[0],
      julyBookings: monthlySummary[1],
      augustBookings: monthlySummary[2],
      septemberBookings: monthlySummary[3],
      novemberBookings: monthlySummary[4],
      decemberBookings: monthlySummary[5],
    );
    myBarData.initializedBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles)),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: TColors.accent,
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: const Color.fromRGBO(149, 185, 197, 1.0),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: TColors.accent,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Jun', style: style);
      break;
    case 1:
      text = const Text('Jul', style: style);
      break;
    case 2:
      text = const Text('Aug', style: style);
      break;
    case 3:
      text = const Text('Sep', style: style);
      break;
    case 4:
      text = const Text('Oct', style: style);
      break;
    case 5:
      text = const Text('Nov', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
