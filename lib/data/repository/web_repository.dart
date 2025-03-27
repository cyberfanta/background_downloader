import 'package:background_downloader/data/repository/repository.dart';

class WebRepository implements Repository {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  Future<void> processRequest(String request) async {
    print('Procesando solicitud: $request');
  }
}
