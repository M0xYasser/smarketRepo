import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/get_info.dart';

createCard(String cardholder, String cardnumber, String expirationdate,
    String cvv, String userId) async {
  await http.post(Uri.parse(
      'https://smartcartapplication.azurewebsites.net/[CardController]/AddCard?cardholder=$cardholder&cardnumber=$cardnumber&expirationdate=$expirationdate&cvv=$cvv&userId=$userId'));
}
