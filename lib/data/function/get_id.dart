import '../../core/constants/constant.dart';
import '../models/get_account_settings.dart';

import '../repository/get_account_settings_repo.dart';

getid(String currentEmail) async {
  // print("hiii");
  String id = "0";
  while (true) {
    GetAccountSettings data =
        await fetchAcoountSettings(accountSettigsUrl + id);
    if (data.email == currentEmail) {
      // print(id);
      break;
    }
    id = (int.parse(id) + 1).toString();
  }
}
