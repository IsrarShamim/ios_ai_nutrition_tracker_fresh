import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

// Sample test data - easy to remove later
final List<String> sampleWeightRecords = [
  "75.5", "76.2", "75.8", "75.0", "74.8",
  "75.3", "74.9", "74.5", "74.2", "74.0", "90.0"
];

final List<String> sampleTimeRecords = [
  "01-02-2024", "03-02-2024", "05-02-2024", "07-02-2024", "09-02-2024",
  "11-02-2024", "13-02-2024", "15-02-2024", "17-02-2024", "19-02-2024", "19-02-2024"
];

class WeightTrackerGraph extends StatelessWidget {
  final List<String> weightRecords;
  final List<String> weightRecordsTime;
  final String weightUnit;
  final VoidCallback onUpdateWeight;

  const WeightTrackerGraph({
    Key? key,
    required this.weightRecords,
    required this.weightRecordsTime,
    required this.onUpdateWeight,
    this.weightUnit = 'kg',
  }) : super(key: key);

  List<FlSpot> _createSpots() {
    return List.generate(weightRecords.length, (index) {
      final date = DateFormat('dd-MM-yyyy').parse(weightRecordsTime[index]);
      final x = date.millisecondsSinceEpoch.toDouble();
      final y = double.parse(weightRecords[index]);
      return FlSpot(x, y);
    });
  }

  double _calculateYAxisInterval(double minY, double maxY) {
    final range = maxY - minY;

    // Choose an appropriate interval based on the range
    if (range <= 5) return 1.0;
    if (range <= 10) return 2.0;
    if (range <= 20) return 4.0;
    return (range / 5).ceil().toDouble(); // Ensure no more than 5 labels
  }

  @override
  Widget build(BuildContext context) {
    final spots = _createSpots();

    // Calculate min and max values with padding
    final weights = weightRecords.map((w) => double.parse(w)).toList();
    final minWeight = weights.reduce((a, b) => a < b ? a : b);
    final maxWeight = weights.reduce((a, b) => a > b ? a : b);

    // Add 5% padding to min and max
    final range = maxWeight - minWeight;
    final padding = range * 0.05;
    final minY = (minWeight - padding).floorToDouble();
    final maxY = (maxWeight + padding).ceilToDouble();

    // Calculate optimal interval
    final leftInterval = _calculateYAxisInterval(minY, maxY);

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Weight Progress',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: onUpdateWeight,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Update Weight'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: leftInterval,
                    verticalInterval: 86400000 * 2, // Show grid every 2 days
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 86400000 * 4, // Show dates every 4 days
                        getTitlesWidget: (value, meta) {
                          final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                          return Transform.rotate(
                            angle: -0.5,
                            child: Text(
                              DateFormat('MMM d').format(date),
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: leftInterval,
                        reservedSize: 45, // Increased space for labels
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              '${value.toStringAsFixed(1)} $weightUnit',
                              style: const TextStyle(fontSize: 11),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  minX: spots.first.x,
                  maxX: spots.last.x,
                  minY: minY,
                  maxY: maxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color: Colors.blue,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.1),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          final date = DateTime.fromMillisecondsSinceEpoch(
                            touchedSpot.x.toInt(),
                          );
                          return LineTooltipItem(
                            '${DateFormat('MMM d, yyyy').format(date)}\n',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: '${touchedSpot.y} $weightUnit',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}