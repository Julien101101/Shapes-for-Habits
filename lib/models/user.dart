class User {
  late final String name;
  late final String id;
  User({
    required this.name,
    required this.id,
  });
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
  User.fromJson(Map<String, dynamic> json){
  name = json['name'];
  id = json['id'];
  }
}

