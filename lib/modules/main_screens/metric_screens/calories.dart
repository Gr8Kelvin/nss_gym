import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nss_gym/utils/assets_path.dart';
import 'package:nss_gym/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CaloriesPage extends StatefulWidget {
  const CaloriesPage({super.key});

  @override
  State<CaloriesPage> createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
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
          'Calories',
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
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 15,
                        color: Colors.black26,
                      ),
                    ],
                    // borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Pblack, Sblack],
                    ),
                  ),
                  child: CircularPercentIndicator(
                    radius: 70.0,
                    lineWidth: 15.0,
                    circularStrokeCap: CircularStrokeCap.round,
                    maskFilter: const MaskFilter.blur(BlurStyle.solid, 8),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${NumberFormat('#,###').format(cal)}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "cal",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    startAngle: 240,
                    // progressColor: Colors.green,
                    percent: 0.8,
                    backgroundColor: Colors.transparent,
                    linearGradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Sorange, Torange],
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: 50,
                    width: 50,
                    image: AssetImage(whitefire),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Total Calories burned',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  'These numbers are based on distance and weight',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 18,
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
                      'Add calories',
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
                        keyboardType: TextInputType.number,
                        controller: calor,
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
                      onPressed: () {
                        setState(() {
                          try {
                            int newcalories = int.parse(calor.text);
                            cal += newcalories;
                          } catch (e) {
                            print('Invalid input');
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Sorange,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'This week',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white,
                      ))
                ],
              ),
              Container(
                height: 115,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const RadialGradient(
                    center: Alignment.centerRight,
                    radius: 0.7,
                    colors: [Forange, Pblack],
                    stops: [
                      0.0,
                      0.9,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Today:',
                            style: TextStyle(
                                color: Sorange,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                  // borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                  ),
                                ),
                                child: CircularPercentIndicator(
                                  radius: 34.0,
                                  lineWidth: 10.0,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  maskFilter:
                                      const MaskFilter.blur(BlurStyle.solid, 0),
                                  center: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "150",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "cal",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  startAngle: 240,
                                  // progressColor: Colors.green,
                                  percent: 1,
                                  backgroundColor: Colors.transparent,
                                  linearGradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Sorange, Torange],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text(
                                'Push ups',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reps completed:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            '10/10',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 115,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const RadialGradient(
                    center: Alignment.centerRight,
                    radius: 0.7,
                    colors: [Forange, Pblack],
                    stops: [
                      0.0,
                      0.9,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tuesday:',
                            style: TextStyle(
                                color: Sorange,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                  // borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                  ),
                                ),
                                child: CircularPercentIndicator(
                                  radius: 34.0,
                                  lineWidth: 10.0,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  maskFilter:
                                      const MaskFilter.blur(BlurStyle.solid, 0),
                                  center: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "85",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "cal",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  startAngle: 240,
                                  // progressColor: Colors.green,
                                  percent: 0.35,
                                  backgroundColor: Colors.transparent,
                                  linearGradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Sorange, Torange],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text(
                                'Squats',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reps completed:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            '7/10',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 115,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const RadialGradient(
                    center: Alignment.centerRight,
                    radius: 0.7,
                    colors: [Forange, Pblack],
                    stops: [
                      0.0,
                      0.9,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Monday:',
                            style: TextStyle(
                                color: Sorange,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                  // borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                  ),
                                ),
                                child: CircularPercentIndicator(
                                  radius: 34.0,
                                  lineWidth: 10.0,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  maskFilter:
                                      const MaskFilter.blur(BlurStyle.solid, 0),
                                  center: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "165",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "cal",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  startAngle: 240,
                                  // progressColor: Colors.green,
                                  percent: 0.6,
                                  backgroundColor: Colors.transparent,
                                  linearGradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Sorange, Torange],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text(
                                'Deadlift',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reps completed:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            '10/20',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
