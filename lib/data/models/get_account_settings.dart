class GetAccountSettings {
  late final String? name;
  late final String? email;
  late final String? language;
  late final String? profilePicture;

  GetAccountSettings.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    language = json["language"];
    profilePicture = json["profilePicture"];
  }
}
