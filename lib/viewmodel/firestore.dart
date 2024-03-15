import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/model/usermodel.dart';

class Firestore {
  final db = FirebaseFirestore.instance;

  Future addUser(UserModel userModel) async {
    db.collection("USER").doc().set(userModel.toJson());
  }

  Future delete() async {
    db.collection("USER").doc("sTtecDSsWWJKY7Avul6M").delete();
  }

  Future update() async {
    db.collection("USER").doc("Nasik").update({"name": "akbar"});
  }
}
