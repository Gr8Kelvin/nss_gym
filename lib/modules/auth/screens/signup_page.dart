import 'package:flutter/material.dart';
import 'package:nss_gym/modules/main_screens/homepage.dart';
import 'package:nss_gym/utils/assets_path.dart';
import 'package:nss_gym/utils/constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  Color biodatacolor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
          width: double.infinity,
          padding: const EdgeInsets.all(12),
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
              const Center(
                child: Text(
                  'Create an Account',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Center(
                child: Text(
                  'Help us finish setting up your account.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                indicatorColor: Sorange,
                unselectedLabelColor: Colors.white,
                indicatorWeight: 1,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 15,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Sorange,
                          ),
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "Account information",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _tabController.index == 1
                                ? Sorange
                                : biodatacolor,
                          ),
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "Biodata Information",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Username',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: username,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Username cannot be empty";
                              }

                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  )),
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'E.g Johntheone',
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
                            obscureText: obscureicon,
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
                                ),
                              ),
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
                            height: 13,
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
                                ),
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                              ),
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
                            height: 13,
                          ),
                          const Text(
                            'Confirm Password',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: confirmpassword,
                            obscureText: obscureicon,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Password cannot be empty";
                              }
                              if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              if (confirmpassword != password) {
                                return "Passwords dont match";
                              }

                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  )),
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Confirm password',
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
                            height: 50,
                          ),
                          Spacer(),
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
                              onPressed: () {
                                _tabController
                                    .animateTo(_tabController.index + 1);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const Homepage(),
                                //   ),
                                // );
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 200,
                          // ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Firstname',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 160,
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      controller: email,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return "Firstname cannot be empty";
                                        }

                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        hintText: 'E.g John',
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 15),
                                        filled: true,
                                        fillColor: textfield,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Last name',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      width: 160,
                                      child: TextFormField(
                                        style: const TextStyle(
                                            color: Colors.white),
                                        cursorColor: Colors.white,
                                        controller: email,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Lastname cannot be empty";
                                          }

                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              top: 10, left: 10),
                                          hintText: 'E.g Appleased',
                                          hintStyle: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 15),
                                          filled: true,
                                          fillColor: textfield,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                            ]),
                        const Text(
                          'Date of Birth',
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
                              return "Please enter a date";
                            }

                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 10),
                            hintText: 'Select a date',
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
                          height: 13,
                        ),
                        const Text(
                          'Location',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: password,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please choose a Location";
                            }

                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 10),
                            hintText: 'Select a location',
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
                          height: 13,
                        ),
                        const Text(
                          'City',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: password,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please choose a city";
                            }

                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 10),
                            hintText: 'Select a city in your location',
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
                          height: 13,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Spacer(),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Homepage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Create your account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   'stress',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 430,
              // ),
              // Container(
              //   height: 55,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     gradient: const LinearGradient(
              //       begin: Alignment.centerLeft,
              //       end: Alignment.centerRight,
              //       colors: [Sorange, Torange],
              //     ),
              //   ),
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.transparent,
              //       shadowColor: Colors.transparent,
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const Homepage(),
              //         ),
              //       );
              //     },
              //     child: const Text(
              //       'Continue',
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16),
              //     ),
              //   ),
              // ),

              // TabBarView(
              //   controller: _tabController,
              //   children: const [
              //     Padding(
              //         padding: EdgeInsets.all(16.0),
              //         child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Username',
              //                 style: TextStyle(
              //                     fontSize: 18, color: Colors.white),
              //               ),
              //               SizedBox(height: 8),
              //             ]))
              //   ],
              // ),
            ],
          )),
    );
  }
}
