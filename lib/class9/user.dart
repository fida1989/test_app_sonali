class User {
  late int userId;
  late int id;
  late String title;
  late bool completed;

  User(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }

  @override
  String toString() {
    return "userId $userId id $id title $title completed $completed";
  }
}
