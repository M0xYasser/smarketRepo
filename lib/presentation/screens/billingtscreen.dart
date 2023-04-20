import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarket_app/presentation/screens/addcard.dart';
import '../../data/repository/delete_card.dart';
import '../widgets/billingwidget.dart';
import '../widgets/customAppBar.dart';
import 'emptycard.dart';
import 'package:http/http.dart' as http;

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

List cardList = [];

class _BillingScreenState extends State<BillingScreen> {
  int userId = 0;

  getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');

    setState(() {
      userId = id!;
    });
  }

  getCardList() async {
    await Future.delayed(const Duration(milliseconds: 10));
    final response = await http.get(Uri.parse(
        'https://smartcartapplication.azurewebsites.net/[CardController]/GetAllUserCard?userId=${userId.toString()}'));
    if (mounted) {
      setState(() {
        cardList = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    getId();

    getCardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomAppBar(
        title: 'Billing Setting',
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 76),
              child: (cardList.isNotEmpty)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: cardList.length,
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 24),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            BillingWidget(
                              state: cardList[index]["cardNameHolder"],
                              cardnumber: cardList[index]["cardNumber"]
                                  .toString()
                                  .substring(
                                      cardList[index]["cardNumber"].length - 4),
                              cardId:
                                  cardList[index]["paymentCardId"].toString(),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        );
                      },
                    )
                  : const EmptyCard(),
            ),
            Center(
              child: Container(
                height: 40,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff2c6976),
                ),
                child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AddCard(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/credit_card.svg'),
                          const SizedBox(
                            width: 12.0,
                          ),
                          const Text(
                            'Add Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "harabaraBold",
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
