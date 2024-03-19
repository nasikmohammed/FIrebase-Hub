import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/model/usermodel.dart';
import 'package:firebase_2/view/screenhome.dart';
import 'package:firebase_2/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodel/firestore.dart';

class ScreenCrud extends StatelessWidget {
  ScreenCrud({super.key});
  final firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AuthController>(context);
    firestore.getAllPlayerData();
    firestore.getSingleUserData("5IFcNFQhlSNrUQaZQgmI");
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Player"),
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
                  hintText: "Position"),
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  firestore.addUser(UserModel(
                      playername: ctrl.player.text,
                      positionof: ctrl.positionname.text,
                      team: ctrl.team.text));
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenHome();
                    },
                  ));
                },
                child: Text(
                  "Add Players",
                  style: GoogleFonts.candal(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
