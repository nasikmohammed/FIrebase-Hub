import 'package:firebase_2/view/forgotpwd.dart';
import 'package:firebase_2/view/screensignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScreenSignin extends StatelessWidget {
  const ScreenSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(),
            TextFormField(),
            OutlinedButton(onPressed: () {}, child: Text("signin")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenSignup();
                    },
                  ));
                },
                child: Text("Signup")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenResetPwd();
                    },
                  ));
                },
                child: Text("Forgot Password????????????????????????????????"))
          ],
        ),
      ),
    );
  }
}
