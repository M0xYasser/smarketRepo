class GetCreateAccount {
  late final String? userName;
  late final String? email;
  late final String? password;
  late final int? id;

  GetCreateAccount.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    email = json["email"];
    password = json["password"];
    id = json["id"];
  }
}
