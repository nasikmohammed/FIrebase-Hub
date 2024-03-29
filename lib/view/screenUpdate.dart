import 'package:firebase_2/view/screenhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/usermodel.dart';
import '../viewmodel/controller.dart';
import '../viewmodel/firestore.dart';

class ScreenUpdate extends StatelessWidget {
  ScreenUpdate({super.key});
  final firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Player Update"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrl.player,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(),
                  border: OutlineInputBorder(),
                  hintText: "Player"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: ctrl.team,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(),
                  border: OutlineInputBorder(),
                  hintText: "Team"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: ctrl.positionname,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(),
                  border: OutlineInputBorder(),
                  hintText: "Country"),
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  firestore.update();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenHome();
                    },
                  ));
                },
                child: Text(
                  "Update Players",
                  style: GoogleFonts.candal(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
