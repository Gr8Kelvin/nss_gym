import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:nss_gym/modules/auth/screens/signup_page.dart';
import 'package:nss_gym/modules/loginmodel.dart';
import 'package:nss_gym/modules/main_screens/homepage.dart';
import 'package:nss_gym/utils/assets_path.dart';
import 'package:nss_gym/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //  void _loadSavedValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     usernname = prefs.getString(_key) ?? ""; // Using ?? "" to handle null case
  //   });
  // }

  Future<dynamic> postSignData(String emailaddress, String password) async {
    setState(() {
      isloading = true;
    });

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    Map<String, String> loginData = {
      "email": emailaddress,
      "password": password,
    };
    final response = await http.post(
        headers: header,
        Uri.parse('https://56ce-41-66-243-226.ngrok-free.app/user/login'),
        body: jsonEncode(loginData));

    Logger().d(jsonDecode(response.body));

    final responseData = jsonDecode(response.body);
    String? fetchedusername = responseData['data']['username'];
    Logger().d(fetchedusername);

    if (fetchedusername != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', fetchedusername);
    }

    setState(() {
      usernname = fetchedusername;
    });

    return response;
  }

  Future<String?> getCachedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      setState(() {
        isloading = true;
      });

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  Future<void> GoogleSignOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.disconnect();
      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  ValueNotifier userCredential = ValueNotifier('');
  bool isloading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(logo),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
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
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Pblack, Sblack],
          ),
        ),
        child: isloading
            ? Container(
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Setting up your Account',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    LoadingAnimationWidget.discreteCircle(
                        color: Colors.white,
                        secondRingColor: Torange,
                        thirdRingColor: Sorange,
                        size: 100),
                  ],
                ),
              ))
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Login to your Account',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: email,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Email cannot be empty";
                              }
                              if (!value.contains("@")) {
                                return "Email is invalid";
                              }
                              if (!value.contains(".")) {
                                return "Email is invalid";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  )),
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Enter your email address',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 15),
                              filled: true,
                              fillColor: textfield,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: password,
                            obscureText: obscureicon,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Password cannot be empty";
                              }
                              if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }

                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureicon = !obscureicon;
                                    });
                                  },
                                  icon: Icon(
                                    obscureicon
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  )),
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  )),
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Enter a password',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 15),
                              filled: true,
                              fillColor: textfield,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                decorationColor: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            height: 55,
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await postSignData(email.text.trim(),
                                          password.text.trim())
                                      .then((val) {
                                    final decoderesponse = jsonDecode(val.body);
                                    Logger().d(
                                        "This is the response $decoderesponse.");
                                    String responseCode =
                                        decoderesponse["responseCode"];
                                    if (responseCode == "000") {
                                      setState(() {
                                        isloading = false;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage(),
                                        ),
                                      );
                                    } else {
                                      print(
                                          "Login failed with responce code: $responseCode");
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Dont have an acoount?   ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              GestureDetector(
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Sorange,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Center(
                            child: const Text(
                              'Alternatively Login with:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Sorange,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Pblack, Sblack],
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    width: 1,
                                    color: Torange,
                                  ),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const LoginScreen(),
                                //   ),
                                // );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image(image: AssetImage('assets/images/')),
                                  const Text(
                                    'Apple ID',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Torange,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Pblack, Sblack],
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    width: 1,
                                    color: Sorange,
                                  ),
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              onPressed: () async {
                                await GoogleSignOut();

                                final UserCredential? userCredential =
                                    await signInWithGoogle();
                                Logger().d('${userCredential}');
                                if (userCredential != null) {
                                  final Map<String, dynamic>? profile =
                                      userCredential
                                          .additionalUserInfo?.profile;
                                  String? givenName = profile?['given_name'];

                                  Logger().d("Given Name: $givenName");

                                  if (givenName != null) {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString(
                                        'given_name', givenName);
                                  }
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  givenName = prefs.getString('given_name');

                                  setState(() {
                                    usernname = givenName;
                                  });

                                  Future<String?> getCachedUsername() async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    return prefs.getString('username');
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Homepage(),
                                    ),
                                  );
                                }
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(google),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'GOOGLE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
