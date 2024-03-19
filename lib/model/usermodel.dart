import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? positionof;
  String? team;
  String? playername;

  UserModel(
      {this.username,
      this.email,
      this.positionof,
      this.team,
      this.playername,
      this.id});

  Map<String, dynamic> toJson(docId) => {
        "country": positionof,
        "team": team,
        "playername": playername,
        "id": docId
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        positionof: json["country"],
        team: json["team"],
        playername: json["playername"],
        id: json["id"]);
  }
}
