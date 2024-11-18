import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nss_gym/firebase_options.dart';
import 'package:nss_gym/modules/auth/screens/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nss_gym/state/auth_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 2400),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return ChangeNotifierProvider(
              create: (context) => AuthenticationProvider(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  useMaterial3: true,
                ),
                home: const SplashPage(),
              ));
        });
  }
}
