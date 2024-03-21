import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_2/view/screenhome.dart';
import 'package:firebase_2/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatelessWidget {
  const ScreenOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AuthController>(context);
    EmailOTP myAuth = EmailOTP();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 217, 192, 192),
        body: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ctrl.otp,
                  decoration: const InputDecoration(
                      hintText: "Enter OTP", border: OutlineInputBorder()),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    ctrl.verifyOTP(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return ScreenHome();
                      },
                    ));
                  },
                  child: const Text("Verify")),
            ],
          ),
        ));
  }
}
