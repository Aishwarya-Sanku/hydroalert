import 'package:flutter/material.dart';
import 'package:hydroalert/ui/widgets/auth/signin_widget.dart';
import 'package:hydroalert/ui/widgets/auth/signup_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn = true;
  int? activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Icon(Icons.alarm, size: 100, color: Color(0xFFA2DDF3)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
              
                "WELCOME TO HYDROALERT !!",
                style: TextStyle(color: Color(0xFFA2DDF3), fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
              
                "Please sign in or sign up",
                style: TextStyle(color: Colors.black87, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            ToggleSwitch(
              activeBgColor: [Color(0xFFA2DDF3)],
              inactiveBgColor: Colors.grey[300],
              minWidth: MediaQuery.of(context).size.width * .7,
              initialLabelIndex: activeIndex,
              totalSwitches: 2,
              labels: ['Sign In', 'Sign Up'],
              onToggle: (index) {
                setState(() {
                  isSignIn = !isSignIn;
                  activeIndex = index;
                });
              },
            ),
            isSignIn
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: SignInWidget())
                : Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: SignUpWidget()),
          ]),
        ),
      ),
    );
  }
}
