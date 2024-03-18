import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/view/screenUpdate.dart';
import 'package:firebase_2/view/screencrud.dart';
import 'package:firebase_2/viewmodel/controller.dart';
import 'package:firebase_2/viewmodel/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    final CollectionReference PlayersID =
        FirebaseFirestore.instance.collection('Players ID');

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 156, 18, 8),
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ScreenCrud();
              },
            ));
          },
        ),
        body: StreamBuilder(
          stream: PlayersID.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot Playersnap =
                      snapshot.data!.docs[index];
                  final id = Playersnap["id"];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        color: Color.fromARGB(255, 238, 238, 219),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(Playersnap["playername"],
                                    style: GoogleFonts.teko(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(Playersnap["team"],
                                    style: GoogleFonts.teko(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  Playersnap["country"],
                                  style: GoogleFonts.teko(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      return ScreenUpdate();
                                    },
                                  ));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 35, 173, 214),
                                )),
                            IconButton(
                                onPressed: () {
                                  firestore.deleteDocument(id);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}

// auth.currentUser!.emailVerified
//                 ? SizedBox()
//                 : Text("${auth.currentUser!.email!}not verified"),
//             SizedBox(
//               height: 150,
//             ),
//             Text(auth.currentUser!.email!),
//             Text(auth.currentUser!.emailVerified
//                 ? "email verified"
//                 : "email not verified")
