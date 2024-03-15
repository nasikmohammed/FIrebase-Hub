import 'package:firebase_2/viewmodel/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AuthController>(context);

    return Scaffold(
        appBar: AppBar(
          title: TextButton(onPressed: () {}, child: Text("Logout")),
        ),
        body: ListView(
          children: [
            auth.currentUser!.emailVerified
                ? SizedBox()
                : Text("${auth.currentUser!.email!}not verified"),
            SizedBox(
              height: 150,
            ),
            Text(auth.currentUser!.email!),
            Text(auth.currentUser!.emailVerified
                ? "email verified"
                : "email not verified")
          ],
        ));
  }
}
