import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatelessWidget {
  const SharedPref({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static setGetHydrated() async {
    await SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setBool("isHydrated", true);
      print(sharedPreferences.getBool("isHydrated"));
    });
  }

  static setLoggedIn() async {
    await SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setBool("isLogged", true);
    });
  }
}
