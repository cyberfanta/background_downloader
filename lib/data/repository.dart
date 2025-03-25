import 'sources/api_source.dart';
import 'sources/local_data.dart';

class Repository {
  Repository({ApiSource? apiSource, LocalData? localData})
    : _apiSource = apiSource ?? ApiSource(),
      _localData = localData ?? LocalData();
  final ApiSource _apiSource;
  final LocalData _localData;
}
