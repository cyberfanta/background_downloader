class Login {
  final String email;
  final String organizationId;

  Login({required this.email, required this.organizationId});

  @override
  String toString() {
    return "Login (Email: \"$email\", OrganizationId: \"$organizationId\")";
  }
}
