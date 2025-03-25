import 'start_chunks.dart';

class StatusChunks {
  final int statusCode;
  final List<StartChunks> body;

  StatusChunks({required this.statusCode, required this.body});

  @override
  String toString() {
    return "StatusChunks (StatusCode: $statusCode, Body: $body)";
  }
}
