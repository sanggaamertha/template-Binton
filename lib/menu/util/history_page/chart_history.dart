import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  List<String> days = ['0', '1', '2', '3', '4', '5', '6', '7'];
  List<int> values = [60000, 150000, 180000, 150000, 180000, 100000, 370000, 360000];

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final List<FlSpot> spots = [];
    for (int i = 0; i < days.length; i++) {
      spots.add(FlSpot(i.toDouble(), values[i].toDouble()));
    }

    return Padding(
      padding: const EdgeInsets.only(top: 3), // Adjust vertical padding
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d)),
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40, // Menambah ruang untuk menampilkan teks dengan baik
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final textStyle = TextStyle(
                    color: isDarkTheme ? Colors.grey[300] : Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 11, // Ukuran teks yang bisa Anda sesuaikan
                  );
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 8, // Jarak antara teks dan sumbu
                    child: Text(
                      value.toInt().toString(),
                      style: textStyle,
                      textAlign: TextAlign.center, // Mengatur teks ke tengah
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final textStyle = TextStyle(
                    color: isDarkTheme ? Colors.grey[300] : Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  );
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      days[value.toInt()],
                      style: textStyle,
                    ),
                  );
                },
              ),
            ),
          ),
          minX: 0,
          maxX: days.length.toDouble() - 1,
          minY: 0,
          maxY: values.reduce((a, b) => a > b ? a : b).toDouble(),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 0,
                color: Colors.black,
                strokeWidth: 0.2,
              ),
              HorizontalLine(
                y: values.reduce((a, b) => a > b ? a : b).toDouble(),
                color: Colors.black,
                strokeWidth: 0.2,
              ),
            ],
            verticalLines: [
              VerticalLine(
                x: 0,
                color: Colors.black,
                strokeWidth: 0.2,
              ),
              VerticalLine(
                x: days.length.toDouble() - 1,
                color: Colors.black,
                strokeWidth: 0.2,
              ),
            ],
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: false,
              color: Colors.blue,
              barWidth: 1,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  void addSomeData(String day, int valuenum) {
    days.add(day);
    values.add(valuenum);
  }
}

class DataPoint {
  final double x;
  final double y;

  DataPoint(this.x, this.y);
}