import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_table/src/widgets/chart/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List chartValues;
  const MyBarGraph({super.key, required this.chartValues});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        janAmount: chartValues[0],
        febAmount: chartValues[1],
        marchAmount: chartValues[2],
        apAmount: chartValues[3],
        mayAmount: chartValues[4],
        junAmount: chartValues[5],
        julAmount: chartValues[6],
        augAmount: chartValues[7],
        sepAmount: chartValues[8],
        octAmount: chartValues[9],
        novAmount: chartValues[10],
        decAmount: chartValues[11]);

    myBarData.initializedBarData();
    return BarChart(
      BarChartData(
          maxY: 5,
          minY: 0,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true, getTitlesWidget: getBottomTitles)),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true, getTitlesWidget: getLeftTitles))),
          barGroups: myBarData.barData
              .map((data) => BarChartGroupData(x: data.x, barRods: [
                    BarChartRodData(
                        toY: data.y,
                        borderRadius: BorderRadius.circular(1),
                        width: 6)
                  ]))
              .toList()),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 10,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  Widget text = const Text('');
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'Jan',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'Feb',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'Mar',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'Apr',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'May',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'Jun',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'Jul',
        style: style,
      );
      break;
    case 7:
      text = const Text(
        'Aug',
        style: style,
      );
      break;
    case 8:
      text = const Text(
        'Sep',
        style: style,
      );
      break;
    case 9:
      text = const Text(
        'Oct',
        style: style,
      );
      break;
    case 10:
      text = const Text(
        'Nov',
        style: style,
      );
      break;
    case 11:
      text = const Text(
        'Dec',
        style: style,
      );
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

Widget getLeftTitles(double value, TitleMeta meta) {
  Widget text = Text('$value', style: style,);

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

const style = TextStyle(
  fontSize: 10,
  color: Colors.black,
  fontWeight: FontWeight.normal,
  decoration: TextDecoration.none,
);
