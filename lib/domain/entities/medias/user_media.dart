import '../entity.dart';

class UserMedia extends Entity<UserMedia> {
  UserMedia({this.id, this.name, this.createdAt, this.lastChangedDateTime});

  String? id;
  String? name;
  String? createdAt;
  String? lastChangedDateTime;

  @override
  UserMedia fromJson(Map<String, dynamic> json) {
    return UserMedia(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      lastChangedDateTime: json['lastChangedDateTime'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['createdAt'] = createdAt;
    map['lastChangedDateTime'] = lastChangedDateTime;
    return map;
  }

  @override
  UserMedia createEmpty() {
    return UserMedia(
      id: "Test",
      name: "",
      createdAt: "",
      lastChangedDateTime: "",
    );
  }

  @override
  String toString() {
    return "\"UserMedia\":"
        "{"
        "\"id\":\"$id\","
        "\"name\":\"$name\","
        "\"createdAt\":\"$createdAt\","
        "\"lastChangedDateTime\":\"$lastChangedDateTime\""
        "}";
  }
}
