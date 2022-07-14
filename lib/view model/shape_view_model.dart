import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vs/models/habits.dart';
import 'package:vs/view%20model/view_model.dart';

class ShapeViewModel extends BaseViewModel {
  CollectionReference ref = FirebaseFirestore.instance.collection('habits');
  FirebaseAuth auth = FirebaseAuth.instance;

  saveHabits(
    String userId,
    String objectType,
    String objectName,
    String color,
    int count,
  ) {
    Habits habits = Habits(
        userId: userId,
        objectName: objectName,
        objectType: objectType,
        color: color,
        count: count);
    ref.add(habits.toJson());
  }

  List habits = [];
  getHabit(String userID) async {
    ref.where('userId', isEqualTo: userID).snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        var _habits = snapshot.docs
            .map((e) => Habits.fromJson(jsonDecode(jsonEncode(e.data()))))
            .toList();
        habits = [..._habits];
        notifyListeners();
      }
    });
  }
}
