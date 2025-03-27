abstract class Repository {
  void init();

  Future<void> processRequest(String request);
}
