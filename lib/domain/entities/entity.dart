import 'dart:convert';

T entityFromJson<T extends Entity<T>>(String str, T Function() createEmpty) =>
    createEmpty().fromJson(json.decode(str));

String entityToJson<T extends Entity<T>>(T entity) =>
    json.encode(entity.toJson());

abstract class Entity<T> {
  Map<String, dynamic> toJson();

  T fromJson(Map<String, dynamic> json);

  T createEmpty();
}
