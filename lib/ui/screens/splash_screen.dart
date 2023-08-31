// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hydroalert/ui/screens/intro_screen.dart';

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
    await Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const IntroScreen()
          ));
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
                            style: TextStyle(color: Colors.black87, fontSize: 35,fontWeight:FontWeight.w900),
                          )
                        ],
                      ),
                      Text("stay hydrated and improve your health",
                          style: TextStyle(color: Colors.black87, fontSize: 16,fontWeight:FontWeight.w500))
                    ]),
              ),
            )));
  }
}
