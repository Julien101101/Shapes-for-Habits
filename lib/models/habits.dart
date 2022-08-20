import 'package:cloud_firestore/cloud_firestore.dart';

class Habits {
  String? id;
  late final String date;
  late final String userId;
  late final String objectName;
  late final String objectType;
  late final int color;
  late final int count;

  Habits({
    this.id,
    required this.date,
    required this.userId,
    required this.objectName,
    required this.objectType,
    required this.color,
    required this.count,
  });
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date'] = date;
    _data['userId'] = userId;
    _data['objectName'] = objectName;
    _data['objectType'] = objectType;
    _data['color'] = color;
    _data['count'] = count;
    return _data;
  }

  Habits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    userId = json['userId'];
    objectName = json['objectName'];
    objectType = json['objectType'];
    color = json['color'];
    count = json['count'];
  }
}
