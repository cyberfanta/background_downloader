import 'dart:convert';

StartChunks startChunksFromJson(String str) =>
    StartChunks.fromJson(json.decode(str));

String startChunksToJson(StartChunks data) => json.encode(data.toJson());

StartChunks startChunksFromJsonJson(Map<String, dynamic>? json) {
  return StartChunks(eTag: json?['ETag'], partNumber: json?['PartNumber']);
}

class StartChunks {
  late String eTag;
  late int partNumber;

  StartChunks({
    required this.eTag,
    required this.partNumber,
  });

  StartChunks.fromJson(dynamic json) {
    eTag = json['ETag'];
    partNumber = json['PartNumber'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ETag'] = eTag;
    map['PartNumber'] = partNumber;
    return map;
  }

  @override
  String toString() {
    return "{\"ETag\": \"${eTag.replaceAll("\"", "\\\"")}\", \"PartNumber\": $partNumber}";
  }
}
