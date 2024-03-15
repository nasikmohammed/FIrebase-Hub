import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? username;
  String? email;
  UserModel({
    this.username,
    this.email,
  });


 Map<String, dynamic> toJson() =>
 
  {"name": username, "email": email};


}
