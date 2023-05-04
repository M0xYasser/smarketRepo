import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarket_app/presentation/screens/selectaddcard.dart';
import '../widgets/customAppBar2.dart';
import '../widgets/selectcardwidget.dart';
import '../widgets/thankyou.dart';
import 'package:http/http.dart' as http;

class SelectCard extends StatefulWidget {
  const SelectCard({super.key});

  @override
  State<SelectCard> createState() => _SelectCardState();
}

List cardList = [];

class _SelectCardState extends State<SelectCard> {
  int userId = 0;

  getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');

    setState(() {
      userId = id!;
    });
  }

  getCardList() async {
    await Future.delayed(const Duration(milliseconds: 30));
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
      body: CustomAppBar2(
        title: 'Select Card',
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: (cardList.isNotEmpty)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: cardList.length,
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 24),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            thankYou(context);
                          },
                          child: Column(
                            children: [
                              SelectCardWidget(
                                state: cardList[index]["cardNameHolder"],
                                cardnumber: cardList[index]["cardNumber"]
                                    .toString()
                                    .substring(
                                        cardList[index]["cardNumber"].length -
                                            4),
                                cardId:
                                    cardList[index]["paymentCardId"].toString(),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const CircularProgressIndicator(),
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
                        builder: (context) => const SelectAddCard(),
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
