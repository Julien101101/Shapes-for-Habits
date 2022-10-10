class TimeTable {
  
  late final String habitId;
  late final bool isDone;
  String? id;

  TimeTable({
    required this.habitId,
    required this.isDone,
    this.id,
  });

  TimeTable.empty();

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['habitId'] = habitId;
    _data['isDone'] = isDone;
    _data['id'] = id;
    return _data;
  }

  TimeTable.fromJson(Map<String, dynamic> json) {
    habitId = json['habitId'];
    isDone = json['isDone'];
    id = json['id'];
  }
}
