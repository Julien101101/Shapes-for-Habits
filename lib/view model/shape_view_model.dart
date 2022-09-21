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

  List names = ['polygon', 'dots', 'lines'];
  String choice = '';
  List<Color> colors = [
    Colors.black,
    Colors.orange,
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.amber
  ];

  int _counter = 3;
  int _linecounter = 1;
  int get counter => _counter;
  int get linecounter => _linecounter;
  String _name = '';
  String get name => _name;
  Color _color = Colors.red;
  Color get color => _color;
  final TextEditingController nameTextEditingController =
      TextEditingController();

  void setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void incrementLine() {
    _linecounter++;
    notifyListeners();
  }

  saveHabits(
    String objectType,
    int count,
  ) async {
    var user = auth.currentUser;

    Habits habits = Habits(
        date: DateTime.now().toString(),
        userId: user!.uid,
        objectName: nameTextEditingController.text,
        objectType: objectType,
        color: _color.value,
        count: count);
    ref.add(habits.toJson()).then((value) {
      ref.doc(value.id).set({
        'id': value.id,
      }, SetOptions(merge: true));
    });
    await resetvalues();
  }

  resetvalues() async {
    _counter = 3;
    nameTextEditingController.clear();
    notifyListeners();
  }

  List<Habits> habits = [];
  getHabit() async {
    var user = auth.currentUser;
    ref
        .where('userId', isEqualTo: user!.uid)
        .orderBy('date',
            descending: true) //.orderBy('date', descending: true, location?)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        print('${snapshot.docs.toString()}');
        var traits = snapshot.docs
            .map((e) => Habits.fromJson(jsonDecode(jsonEncode(e.data()))))
            .toList();
        habits = [...traits];
        notifyListeners();
      }
    });
  }

  editHabit(String id, int counter) async {
    await ref.doc(id).set({
      'count': counter,
    }, SetOptions(merge: true));
  }

  deleteHabit(String id) async {
    await ref.doc(id).delete();
    notifyListeners();
  }

  editIndex(String id, int index) async {
    await ref.doc(id).set({'index': index}, SetOptions(merge: true));
  }


}
