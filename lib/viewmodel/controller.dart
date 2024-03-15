import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/model/usermodel.dart';
import 'package:firebase_2/view/otp.dart';
import 'package:firebase_2/view/screenhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:email_auth/email_auth.dart';
import 'package:get/get.dart';

class AuthController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  TextEditingController resetlink = TextEditingController();
  TextEditingController otp = TextEditingController();
  EmailOTP myAuth = EmailOTP();

  signup(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) async {
        await verifyemail();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          content: Text("invalid  email"),
          action: SnackBarAction(
            label: "Undo",
            textColor: Colors.white,
            onPressed: () {},
          ),
        ));
      }
    }
  }

  signout() async {
    await auth.signOut();
  }

  signin() async {
    await auth.signInWithEmailAndPassword(
        email: loginemail.text, password: loginpassword.text);
  }

  verifyemail() async {
    await auth.currentUser?.sendEmailVerification();
  }

  emailotp(context) async {
    myAuth.setConfig(
        appEmail: "Firebasehub@gmail.com",
        appName: "OTP VERIFICATION",
        userEmail: email.text,
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    if (await myAuth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }

  verifyOTP(context) async {
    if (await myAuth.verifyOTP(otp: otp.text) == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP is verified"),
      ));
      signup(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid OTP"),
      ));
    }
  }
}
