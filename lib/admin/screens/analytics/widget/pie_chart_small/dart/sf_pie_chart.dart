import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfPieChart extends StatefulWidget {
  SfPieChart({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SfPieChartState createState() => _SfPieChartState();
}

class _SfPieChartState extends State<SfPieChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Positioned(
          top: 51,
          left: 65,
          child:
              Text('70%', style: Theme.of(context).textTheme.headlineMedium)),
      SfCircularChart(
        legend: const Legend(
          isVisible: true,
          shouldAlwaysShowScrollbar: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom,
          textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          itemPadding: 5,
          isResponsive: true,
        ),
        tooltipBehavior: _tooltipBehavior,
        palette: const [TColors.accentSecondary, TColors.accent],
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
            radius: '42',
            innerRadius: '55',
            legendIconType: LegendIconType.diamond,
          ),
        ],
      ),
    ])));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Cancelled', 30),
      GDPData('Completed', 70),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);

  final String continent;
  final double gdp;
}
