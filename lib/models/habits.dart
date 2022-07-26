import 'package:flutter/cupertino.dart';

class Habits {
  late final String userId;
  late final String objectName;
  late final String objectType;
  late final int color;
  late final int count;

  Habits({
    required this.userId,
    required this.objectName,
    required this.objectType,
    required this.color,
    required this.count,
  });
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['objectName'] = objectName;
    _data['objectType'] = objectType;
    _data['color'] = color;
    _data['count'] = count;
    return _data;
  }

  Habits.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    objectName = json['objectName'];
    objectType = json['objectType'];
    color = json['color'];
    count = json['count'];
  }
}
