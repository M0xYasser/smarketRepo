class GetCreateAccount {
  late final String? success;
  late final int? id;

  GetCreateAccount.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    id = json["userId"];
  }
}
