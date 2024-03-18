import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/model/usermodel.dart';

class Firestore {
  final db = FirebaseFirestore.instance;
  final CollectionReference PlayersID =
      FirebaseFirestore.instance.collection('Players ID');
  Future addUser(UserModel userModel) async {
    final doc = db.collection("Players ID").doc();

    doc.set(userModel.toJson(doc.id));
  }

  Future deleted() async {
    db.collection("Players ID").doc("hbc1O0agLx3VczrewgBx").delete();
  }

  Future update() async {
    db.collection("Players ID").doc().update({"name": "akbar"});
  }

  void deleteDocument(id) async {
    try {
      await FirebaseFirestore.instance
          .collection('Players ID')
          .doc(id)
          .delete();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  UserModel? singleuserData;
  getSingleUserData(docId) async {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await db.collection("Players ID").doc(docId).get();
    if (docSnapshot.exists) {
      singleuserData = UserModel.fromJson(docSnapshot.data()!);
    }
    print(singleuserData!.playername);
  }

  List<UserModel> userLis = [];
  getAllPlayerData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("Players ID").get();

    // print(querySnapshot.docs.length);

    // for (int i = 0; i < querySnapshot.docs.length; i++) {
    //   userLis.add(UserModel.fromJson(querySnapshot.docs[i].data()));
    // }
   userLis= querySnapshot.docs.map(
      (e) {
        return UserModel.fromJson(e.data());
      },
    ).toList();

    print("bjjjjjjjjjjjj");
    print(userLis.length);
    // for(int i=0,i)
  }
}
