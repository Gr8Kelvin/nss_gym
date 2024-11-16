import 'package:flutter/material.dart';
import 'package:nss_gym/modules/main_screens/metric_screens/body_weight.dart';
import 'package:nss_gym/modules/main_screens/metric_screens/calories.dart';
import 'package:nss_gym/modules/main_screens/metric_screens/goals.dart';
import 'package:nss_gym/modules/main_screens/metric_screens/time_under_tension.dart';
import 'package:nss_gym/utils/assets_path.dart';
import 'package:nss_gym/utils/constants.dart';

class MetricPage extends StatefulWidget {
  const MetricPage({super.key});

  @override
  State<MetricPage> createState() => _MetricpageState();
}

class _MetricpageState extends State<MetricPage> {
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
          'Metrics',
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
        width: double.infinity - 10,
        padding: const EdgeInsets.only(top: 12, right: 0, left: 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Pblack, Sblack],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BodyWeightPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 125,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const RadialGradient(
                        center: Alignment.topCenter,
                        radius: 0.8,
                        colors: [Sorange, Pblack],
                        stops: [
                          -1.4,
                          0.4,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(fire),
                        ),
                        Text(
                          'Body Weight',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Input weight weekly to\n track progress.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CaloriesPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 125,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const RadialGradient(
                        center: Alignment.topCenter,
                        radius: 0.8,
                        colors: [Sorange, Pblack],
                        stops: [
                          -1.4,
                          0.4,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(fire),
                        ),
                        Text(
                          'Calories burned',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Based on distance and\n weight.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const GoalsPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 125,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const RadialGradient(
                        center: Alignment.topCenter,
                        radius: 0.8,
                        colors: [Sorange, Pblack],
                        stops: [
                          -1.4,
                          0.4,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(goals),
                        ),
                        Text(
                          'Goals',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'List of all goals created.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const TUTPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 125,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const RadialGradient(
                        center: Alignment.topCenter,
                        radius: 0.8,
                        colors: [Sorange, Pblack],
                        stops: [
                          -1.4,
                          0.4,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(tut),
                        ),
                        Text(
                          'T.U.T',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Time Under tension.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
