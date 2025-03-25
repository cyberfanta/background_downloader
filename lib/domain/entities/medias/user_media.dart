import '../entity.dart';

class UserMedia extends Entity<UserMedia> {
  UserMedia({
    required this.id,
    required this.name,
    required this.location,
    required this.credentialUsername,
    required this.preview,
    required this.extension,
    this.createdAt,
    this.lastChangedDateTime,
  });

  String id;
  String name;
  String location;
  String? credentialUsername;
  String preview;
  String extension;
  String? createdAt;
  String? lastChangedDateTime;

  @override
  UserMedia fromJson(Map<String, dynamic> json) {
    return UserMedia(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      credentialUsername: json['credentialUsername'],
      preview: json['preview'],
      extension: json['extension'],
      createdAt: json['createdAt'],
      lastChangedDateTime: json['lastChangedDateTime'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['location'] = location;
    map['credentialUsername'] = credentialUsername;
    map['preview'] = preview;
    map['extension'] = extension;
    map['createdAt'] = createdAt;
    map['lastChangedDateTime'] = lastChangedDateTime;
    return map;
  }

  @override
  UserMedia createEmpty() {
    return UserMedia(
      id: "Test",
      name: "",
      location: "",
      credentialUsername: "",
      preview: "",
      extension: "",
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
        "\"location\":\"$location\","
        "\"credentialUsername\":$credentialUsername,"
        "\"preview\":\"$preview\","
        "\"extension\":$extension,"
        "\"createdAt\":\"$createdAt\","
        "\"lastChangedDateTime\":\"$lastChangedDateTime\""
        "}";
  }
}
