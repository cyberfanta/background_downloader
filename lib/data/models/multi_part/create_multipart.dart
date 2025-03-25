import 'dart:convert';

CreateMultipart createMultipartFromJson(String str) =>
    CreateMultipart.fromJson(json.decode(str));

String createMultipartToJson(CreateMultipart data) =>
    json.encode(data.toJson());

class CreateMultipart {
  late String uploadId;
  late String key;

  CreateMultipart({
    required this.uploadId,
    required this.key,
  });

  CreateMultipart.fromJson(dynamic json) {
    uploadId = json['UploadId'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UploadId'] = uploadId;
    map['key'] = key;
    return map;
  }

  @override
  String toString() {
    return "CreateMultipart (UploadId: \"$uploadId\", key: \"$key\")";
  }
}
