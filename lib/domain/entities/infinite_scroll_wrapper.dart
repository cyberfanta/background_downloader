import 'entity.dart';

class InfiniteScrollWrapper<T extends Entity<T>> {
  InfiniteScrollWrapper({
    this.data,
    this.itemAmount,
    this.currentOffset,
    this.pageSize,
  });

  List<T>? data;
  int? itemAmount;
  int? currentOffset;
  int? pageSize;

  InfiniteScrollWrapper.fromJson(dynamic json, T Function() createEmpty) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(createEmpty().fromJson(v));
      });
    }
    itemAmount = json['total'];
    currentOffset = json['offset'];
    pageSize = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['total'] = itemAmount;
    map['offset'] = currentOffset;
    map['limit'] = pageSize;
    return map;
  }

  @override
  String toString() {
    return "\"InfiniteScrollWrapper\":"
        "{"
        "\"data\":$data,"
        "\"total\":$itemAmount,"
        "\"offset\":\"$currentOffset\","
        "\"limit\":\"$pageSize\""
        "}";
  }
}
