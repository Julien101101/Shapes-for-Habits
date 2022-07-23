import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:vs/models/model.dart';
import 'package:vs/view%20model/view_model.dart';

class UserViewModel extends BaseViewModel {
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  String getRandom(int length) {
    const ch = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random r = Random();
    return String.fromCharCodes(
        Iterable.generate(length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
  }

  //saving user to firebase
  createUser() async {
    String id = getRandom(10);
    setLoading();
    Model appUser = Model(name: nameTextEditingController.text, id: id);
    await ref.doc(id).set(appUser.toJson());
    setLoading();
    return id;
  }

  //getting user from firebase
  Model appUser = Model.empty();
  getUser(String id) async {
    ref.doc(id).snapshots().listen((snapshot) {
      if (snapshot.exists) {
        appUser = Model.fromJson(snapshot as Map<String, dynamic>);
      }
    });
  }
}
