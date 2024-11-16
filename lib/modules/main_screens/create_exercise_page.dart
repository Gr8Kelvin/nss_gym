import 'package:flutter/material.dart';
import 'package:nss_gym/modules/main_screens/metric_screens/body_weight.dart';
import 'package:nss_gym/utils/assets_path.dart';
import 'package:nss_gym/utils/constants.dart';

class CreateExercisePage extends StatefulWidget {
  const CreateExercisePage({super.key});

  @override
  State<CreateExercisePage> createState() => _CreateExercisePageState();
}

class _CreateExercisePageState extends State<CreateExercisePage> {
  Color warmupcolor = Colors.orange;
  Color maincolor = Colors.orange;
  Color cooldowncolor = Colors.orange;

  
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
          'Goals',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(30, 50),
                        side: BorderSide(
                          width: 1,
                          color: warmupcolor,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.zero,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
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
                        child: const Image(
                          color: Colors.orange,
                          width: 30,
                          height: 30,
                          image: AssetImage('assets/images/refresh.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Warm up',
                      style: TextStyle(color: warmupcolor, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        fixedSize: const Size(30, 50),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
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
                        child: const Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(mainicon),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Main',
                      style: TextStyle(color: Colors.orange, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        fixedSize: const Size(30, 50),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
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
                        child: const Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(cooldown),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'CoolDown',
                      style: TextStyle(color: Colors.orange, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              child: Visibility(
                visible: warmuppage,
                child: Column(
                  children: [
                    SizedBox(
                      height: 19,
                    ),
                    Text(
                      'Regular exercise',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
