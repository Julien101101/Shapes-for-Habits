import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:vs/models/model.dart';
import 'package:vs/screens/login_screen.dart';
import 'package:vs/view%20model/view_model.dart';

class UserViewModel extends BaseViewModel {
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  Future<bool> isUserLoggedIn() async {
    var user = auth.currentUser;
    return user != null;
  }

  String getRandom(int length) {
    const ch = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random r = Random();
    return String.fromCharCodes(
        Iterable.generate(length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
  }

  //saving user to firebase
  createUser() async {
    try {
      String name = nameTextEditingController.text;
      String email = emailTextEditingController.text;
      String password = passwordTextEditingController.text;
      setLoading();
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Model model = Model(
          email: email,
          name: name,
          id: user.user!.uid,
        );
        await ref.doc(user.user!.uid).set(model.toJson());
        setLoading();
        return true;
      }
    } catch (e) {
      return e.toString();
    }
  }

  loginUser() async {
    try {
      String email = emailTextEditingController.text;
      String password = passwordTextEditingController.text;
      setLoading();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return e.toString();
    }
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
