import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore {
  final db = FirebaseFirestore.instance;
  final CollectionReference PlayersID =
      FirebaseFirestore.instance.collection('Players ID');

  //CRUD CREATE
  Future addUser(UserModel userModel) async {
    final doc = db.collection("Players ID").doc();

    doc.set(userModel.toJson(doc.id));
  }

  //CRUD UPDATE
  Future update() async {
    db.collection("Players ID").doc().update({"name": "akbar"});
  }

// CRUD DELETE
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
    userLis = querySnapshot.docs.map(
      (e) {
        return UserModel.fromJson(e.data());
      },
    ).toList();

    print(userLis.length);
    // for(int i=0,i)
  }

//Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//Facebook
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  // Git hub
  Future<UserCredential> signInWithGitHub() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    return await FirebaseAuth.instance.signInWithProvider(githubProvider);
  }
}
