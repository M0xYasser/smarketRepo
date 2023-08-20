import 'package:Smarket/data/function/send_mail.dart';

import '../models/get_home.dart';
import '../repository/get_home.dart';

void main() async {
  for (int i = 0; i <= 100; i++) {
    GetHome data = await homeInfo(i);
    if (data.userEmail == "Not Found") {
      sendEMail(
          email: data.userEmail!,
          to_name: data.userName!,
          message:
              """Are you feeling thirsty and craving for a refreshing drink? Look no further than Pepsi, the ever-popular and delicious carbonated beverage that satisfies your thirst and taste buds. At Smarket App, we bring you the best deals and discounts on Pepsi products, offering you the perfect opportunity to grab your favorite drink at an affordable price. Beat the heat this summer with the crisp and refreshing taste of Pepsi, available at Smarket App. Place your order now and enjoy the ultimate Pepsi experience!

Best regards,
Smarket App Team""");
    }
  }
}
