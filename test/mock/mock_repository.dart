import 'package:background_downloader/data/repository/repository.dart';

class MockRepository implements Repository {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  Future<void> processRequest(String request) async {
    print('Simulación de solicitud procesada: $request');
  }
}
