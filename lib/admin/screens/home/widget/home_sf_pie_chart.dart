import 'package:appointment_app/utils/constants/colors.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeSfPieChart extends StatefulWidget {
  HomeSfPieChart({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomeSfPieChartState createState() => _HomeSfPieChartState();
}

class _HomeSfPieChartState extends State<HomeSfPieChart> {
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
    return Scaffold(
        body: Stack(
      children: [
        SfCircularChart(
          backgroundColor: TColors.accent,
          // title:
          // ChartTitle(text: 'Continent wise GDP - 2021 \n (in billions of USD)'),
          legend: const Legend(
            isVisible: true,
            orientation: LegendItemOrientation.horizontal,
            alignment: ChartAlignment.center,
            overflowMode: LegendItemOverflowMode.wrap,
            isResponsive: true,
            padding: 19,
            itemPadding: 10,
            textStyle: TextStyle(
                fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500),
            offset: Offset(0, 440),
          ),
          palette: [
            Colors.orange.shade300,
            Colors.pink.shade200,
            Colors.teal.shade100,
            Colors.lightGreenAccent,
            Colors.indigo.shade300,
            Colors.green.shade400,
            Colors.yellow.shade300,
            Colors.purple.shade300,
            Colors.blue.shade400,
          ],
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            DoughnutSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true,
              radius: '90',
              innerRadius: '140',
              legendIconType: LegendIconType.rectangle,
            ),
          ],
        ),
        Positioned(
          top: 255,
          left: 175,
          child: Column(
            children: [
              Text(
                '366',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .apply(color: Colors.white,fontSizeDelta: -2),
              ),
              Text(
                'Bookings',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white),
              ),
            ],
          )
        )
      ],
    ));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Facial Care', 64),
      GDPData('Gluta Drips', 20),
      GDPData('Massage Service', 46),
      GDPData('Eye Service', 30),
      GDPData('Slimming Service', 24),
      GDPData('Waxing Hair Removal', 19),
      GDPData('Carbon Laser Treatment', 66),
      GDPData('Laser Treatment Diode Hair Removal', 59),
      GDPData('Warts Removal', 38),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);

  final String continent;
  final int gdp;
}
