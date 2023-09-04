// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hydroalert/ui/screens/auth_screen.dart';
import 'package:hydroalert/ui/screens/home_screen.dart';
import 'package:hydroalert/ui/screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  //const color = const Color(0xFFOCB5AB);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToRequiredPageAfterFewSeconds();
  }

  void _navigateToRequiredPageAfterFewSeconds() async {
    var isLoggedIn;
    var isgettingHydrated;
    SharedPreferences.getInstance().then((sharedPreferences) {
      isLoggedIn = sharedPreferences.getBool('isLogged');
      if (isLoggedIn == null) isLoggedIn = false;
      print("in");
    });

    SharedPreferences.getInstance().then((sharedPreferences) {
      isgettingHydrated = sharedPreferences.getBool('isHydrated');
      if (isgettingHydrated == null) isgettingHydrated = false;
      print("in1");
    });

    await Future.delayed(Duration(seconds: 3), () {
      print(isLoggedIn);
      print(isgettingHydrated);

      if (!isgettingHydrated) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => IntroScreen()));
      } else {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AuthScreen()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFA2DDF3),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alarm,
                            size: 55,
                            color: Colors.black87,
                          ),
                          Text(
                            "HYDROALERT",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 35,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                      Text("stay hydrated and improve your health",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))
                    ]),
              ),
            )));
  }
}
