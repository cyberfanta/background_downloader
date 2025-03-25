class MainObject {
  final String email;

  MainObject({required this.email});

  @override
  String toString() {
    return "Login (Email: \"$email\")";
  }
}
