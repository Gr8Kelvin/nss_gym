import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nss_gym/utils/assets_path.dart';
import 'package:nss_gym/utils/constants.dart';

class BodyWeightPage extends StatefulWidget {
  const BodyWeightPage({super.key});

  @override
  State<BodyWeightPage> createState() => _BodyWeightPageState();
}

class _BodyWeightPageState extends State<BodyWeightPage> {
  final List<double> weights = [200, 180, 195, 190, 160, 155, 140, 135, 130];
  final double goalWeight = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Body Weight',
          style: TextStyle(color: Colors.grey),
        ),
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Pblack, Sblack], // Define your colors
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity - 10,
        padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Pblack, Sblack],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 75,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 0,
                            color: Torange,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Pblack, Sblack],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          side: const BorderSide(
                            width: 1,
                            color: Sorange,
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const LoginScreen(),
                          //   ),
                          // );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                '2024',
                                style: TextStyle(
                                    color: Sorange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            Icon(
                              size: 27,
                              Icons.arrow_drop_down,
                              color: Sorange,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 45,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 0,
                            color: Torange,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Pblack, Sblack],
                        ),
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side: const BorderSide(
                                width: 1,
                                color: Sorange,
                              ),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              )),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              barrierColor: Colors.transparent,
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                              helpText: 'Select date of birth',
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.dark(
                                          primary: Sorange,
                                          onPrimary: Torange,
                                          onSurface: Torange),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                            textStyle:
                                                TextStyle(color: Sorange),
                                            foregroundColor: Torange),
                                      ),
                                      dialogBackgroundColor: Colors.white),
                                  child: child!,
                                );
                              },
                            );
                          },
                          child: const Image(image: AssetImage(calender))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 230,
                  width: double.infinity,
                  child: BarChart(
                    BarChartData(
                      maxY: 250,
                      minY: 0,
                      barGroups: _buildBarGroups(),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Week ${value.toInt() + 1}',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 8),
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text('${value.toInt()}',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 8));
                            },
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: const FlGridData(show: false),
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          // tooltipBgColor: Colors.black54,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              'Goal: ${goalWeight}kg\nWeight: ${rod.toY}kg',
                              const TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                      extraLinesData: ExtraLinesData(
                        horizontalLines: [
                          HorizontalLine(
                            y: goalWeight,
                            color: Colors.red,
                            // strokeWidth: 2,
                            // dashArray: [5, 5],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  // height: 5000,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const RadialGradient(
                            center: Alignment.topCenter,
                            radius: 0.9,
                            colors: [Forange, Pblack],
                            stops: [
                              0.0,
                              0.9,
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Weight goal:',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '120Kg',
                                  style: TextStyle(
                                      color: Sorange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Time left to goal:',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '10/9/2023',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 30,
                              width: 30,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage(pencil),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Weekly weight log',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 0,
                              color: Sorange,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Sorange,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Pblack, Sblack],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Add new weight',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 25,
                              width: 140,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                cursorColor: Colors.white,
                                cursorHeight: 12,
                                cursorWidth: 1,
                                decoration: InputDecoration(
                                  fillColor: textfield,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Sorange,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const RadialGradient(
                            center: Alignment.topCenter,
                            radius: 0.9,
                            colors: [Forange, Pblack],
                            stops: [
                              0.0,
                              0.9,
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Week 9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   width: 40,
                            // ),
                            const Text(
                              '130kg',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 40,
                              width: 30,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage(pencil),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const RadialGradient(
                            center: Alignment.topCenter,
                            radius: 0.9,
                            colors: [Forange, Pblack],
                            stops: [
                              0.0,
                              0.9,
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Week 9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   width: 40,
                            // ),
                            const Text(
                              '130kg',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 40,
                              width: 30,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage(pencil),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const RadialGradient(
                            center: Alignment.topCenter,
                            radius: 0.9,
                            colors: [Forange, Pblack],
                            stops: [
                              0.0,
                              0.9,
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Week 9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   width: 40,
                            // ),
                            const Text(
                              '130kg',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 40,
                              width: 30,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage(pencil),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const RadialGradient(
                            center: Alignment.topCenter,
                            radius: 0.9,
                            colors: [Forange, Pblack],
                            stops: [
                              0.0,
                              0.9,
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Week 9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   width: 40,
                            // ),
                            const Text(
                              '130kg',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 40,
                              width: 30,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage(pencil),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(weights.length, (index) {
      return BarChartGroupData(x: index, barRods: [
        BarChartRodData(
          toY: weights[index],
          width: 12,
          borderRadius: BorderRadius.circular(4),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Sorange, Torange],
          ),
        ),
      ]);
    });
  }
}
