import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter your name",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Enter your password again",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA2DDF3),
              ),
              onPressed: () {},
              child: Text("Sign Up", style: TextStyle(color: Colors.black87)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "By signing up, you agree to our ",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  TextSpan(
                    text: "Terms of Service ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}