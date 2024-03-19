import 'package:firebase_2/model/usermodel.dart';
import 'package:firebase_2/view/screenhome.dart';
import 'package:firebase_2/viewmodel/controller.dart';
import 'package:firebase_2/viewmodel/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'otp.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});
  Firestore firestore = Firestore();
  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AuthController>(
      context,
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 192, 192),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //username
            TextFormField(
              decoration: InputDecoration(
                  hintText: " username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              controller: ctrl.username,
            ),
            SizedBox(
              height: 10,
            ),
            //email
            TextFormField(
              decoration: InputDecoration(
                  hintText: "  email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              controller: ctrl.email,
            ),
            SizedBox(
              height: 10,
            ),

            //password
            TextFormField(
                decoration: InputDecoration(
                    hintText: "  password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                controller: ctrl.password),
            SizedBox(
              height: 10,
            ),

            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color.fromARGB(255, 29, 43, 121)),
                onPressed: () {
               //  firestore.update();
                   ctrl.emailotp(context);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                     builder: (context) {
                       return ScreenOtp();
            },
                   ), (route) => false);
                },
                child: Text(
                  "signup",
                  style: GoogleFonts.teko(color: Colors.white, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
