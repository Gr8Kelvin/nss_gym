// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class BarChart extends StatelessWidget {

// final List<BarChartGroupData> chartData;

//   const BarChart({super.key, required this.chartData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();

//   }
// }



//  return List<BarChartGroupData> _buildBarGroups(dynamic weights) {
//     return List.generate(weights.length, (index) {
//       return BarChartGroupData(x: index, barRods: [
//         BarChartRodData(
//           toY: weights[index],
//           width: 12,
//           borderRadius: BorderRadius.circular(4),
//           gradient: const LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: [Sorange, Torange],
//           ),
//         ),
//       ]);
//     });
//   }}