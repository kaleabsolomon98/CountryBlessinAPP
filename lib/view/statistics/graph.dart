import 'package:countyourblessings/view/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<Color> gradientColors = [
    kPrimaryColor,
    kSecondaryColor,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(
          showTitles: false,
          margin: 0,
        ),
        topTitles: SideTitles(
          showTitles: false,
          margin: 0,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 0,
          interval: 1.0,
          getTextStyles: (context, value) => const TextStyle(
            color: kBlackColor,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Jan';
              case 2:
                return 'Feb';
              case 3:
                return 'Mar';
              case 4:
                return 'Apr';
              case 5:
                return 'May';
              case 6:
                return 'Jun';
              case 7:
                return 'Jul';
              case 8:
                return 'Aug';
            }
            return '';
          },
          margin: 20,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (context, value) => const TextStyle(
            color: kBlackColor,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 1:
                return '10';
              case 2:
                return '20';
              case 3:
                return '30';
              case 4:
                return '40';
              case 5:
                return '50';
            }
            return '';
          },
          reservedSize: 18,
          margin: 20,
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(
          color: kSecondaryColor,
          width: 1,
        ),
      ),
      minX: 0,
      maxX: 9,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0.5, 1),
            FlSpot(3, 1),
            FlSpot(4.5, 4.5),
            FlSpot(7.0, 1.0),
            FlSpot(8.4, 3),
          ],
          isCurved: true,
          colors: [
            kTertiaryColor,
            kTertiaryColor,
          ],
          barWidth: 7,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              radius: 4,
              strokeColor: kSecondaryColor,
              strokeWidth: 2,
              color: kPrimaryColor,
            ),
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientTo: const Offset(0, 1),
            // gradientFrom: Offset(5, 3),
            colors: [
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
      ],
    );
  }
}
