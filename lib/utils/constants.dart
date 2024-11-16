import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController dob = TextEditingController();
TextEditingController location = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController calor = TextEditingController();
TextEditingController duration = TextEditingController();
TextEditingController textreps = TextEditingController();
TextEditingController textsets = TextEditingController();
TextEditingController textexercise = TextEditingController();

int durationtime = 30;
int repscard = 115;
int setscard = 15;
int exercisecard = 5;

int reps = 7;
int sets = 10;
int weight = 150;
int resttimer = 80;
int cal = 3600;

bool obscureicon = false;
bool warmuppage = true;
bool mainiconpage = false;
bool cooldownpage = false;

int selectedbuttonindex = 1;

const Color Porange = Color(0xFFF06500);
const Color Sorange = Color(0xFFFFA05C);
const Color Torange = Color(0xFFF88430);
const Color Forange = Color(0xFFAA7752);
const Color Pblack = Color(0xFF121416);
const Color Sblack = Color(0xFF353A40);
const Color Tblack = Color(0xFF161512);
Color textfield = Colors.grey[700]!;
const Color Pcard = Color(0xFF342519);
const Color Scard = Color(0xFFEA8945);
// const Color Porange = Color(0xFFF06500);
// const Color Porange = Color(0xFFF06500);
// const Color Porange = Color(0xFFF06500);

// List<BarChartGroupData> _buildBarGroups(dynamic weights) {
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
//   }