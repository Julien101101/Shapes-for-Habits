class Model {
  late final String email;
  late final String name;
  late final String id;
  Model({
    required this.email,
    required this.name,
    required this.id,
  });
  Model.empty();
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }

  Model.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    id = json['id'];
  }
}
