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
  // Color warmupcolor = Colors.orange;
  // Color maincolor = Colors.orange;
  // Color cooldowncolor = Colors.orange;

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
          'Create Exercise',
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
        height: 3000,
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
                            color: selectedbuttonindex == 1
                                ? Sorange
                                : Colors.white,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            warmuppage = true;
                            mainiconpage = false;
                            cooldownpage = false;
                            selectedbuttonindex = 1;
                          });
                        },
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
                          child: Image(
                            color: selectedbuttonindex == 1
                                ? Sorange
                                : Colors.white,
                            width: 30,
                            height: 30,
                            image:
                                const AssetImage('assets/images/refresh.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Warm up',
                        style: TextStyle(
                            color: selectedbuttonindex == 1
                                ? Sorange
                                : Colors.white,
                            fontSize: 12),
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
                          side: BorderSide(
                            width: 1,
                            color: selectedbuttonindex == 2
                                ? Sorange
                                : Colors.white,
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            warmuppage = false;
                            mainiconpage = true;
                            cooldownpage = false;
                            selectedbuttonindex = 2;
                          });
                        },
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
                          child: Image(
                            color: selectedbuttonindex == 2
                                ? Sorange
                                : Colors.white,
                            width: 30,
                            height: 30,
                            image: const AssetImage(mainicon),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Main',
                        style: TextStyle(
                            color: selectedbuttonindex == 2
                                ? Sorange
                                : Colors.white,
                            fontSize: 12),
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
                          side: BorderSide(
                            width: 1,
                            color: selectedbuttonindex == 3
                                ? Sorange
                                : Colors.white,
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            warmuppage = false;
                            mainiconpage = false;
                            cooldownpage = true;
                            selectedbuttonindex = 3;
                          });
                        },
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
                          child: Image(
                            color: selectedbuttonindex == 3
                                ? Sorange
                                : Colors.white,
                            width: 30,
                            height: 30,
                            image: const AssetImage(cooldown),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'CoolDown',
                        style: TextStyle(
                            color: selectedbuttonindex == 2
                                ? Sorange
                                : Colors.white,
                            fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
              Visibility(
                visible: warmuppage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 29,
                    ),
                    const Text(
                      'Regular exercise',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 38,
                      width: double.infinity,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        cursorHeight: 12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          hintText: 'Enter a title for the exercise',
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          fillColor: textfield,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Set Goal',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.info,
                          size: 15,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        border: Border.all(color: Colors.white, width: 0.3),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        cursorHeight: 12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white,
                          ),
                          hintText: '2 months',
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Reps:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$reps reps',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        reps++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        reps--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Sets:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$sets sets',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        sets++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        sets--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Weight:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$weight lbs',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Rest timer:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$resttimer s',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        resttimer++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        resttimer--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Sorange, Torange],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateExercisePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Create new plan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: mainiconpage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 29,
                    ),
                    const Text(
                      'Regular exercise',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 38,
                      width: double.infinity,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        cursorHeight: 12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          hintText: 'Enter a title for the exercise',
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          fillColor: textfield,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Set Goal',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.info,
                          size: 15,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        border: Border.all(color: Colors.white, width: 0.3),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        cursorHeight: 12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white,
                          ),
                          hintText: '2 months',
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Reps:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$reps reps',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        reps++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        reps--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Sets:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$sets sets',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        sets++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        sets--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Weight:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$weight lbs',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Rest timer:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '$resttimer s',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        resttimer++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        resttimer--;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.grey,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          height: 120,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment.topCenter,
                              radius: 0.7,
                              colors: [Forange, Pblack],
                              stops: [
                                -1.4,
                                0.7,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Sorange, Torange],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateExercisePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Next set',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: cooldownpage,
                child: Column(
                  children: [
                    SizedBox(
                      height: 19,
                    ),
                    Text(
                      'another exercise',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
