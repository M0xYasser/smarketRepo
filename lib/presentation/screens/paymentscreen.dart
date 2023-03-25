import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/payment_detailes.dart';
import '../widgets/customAppBar.dart';
import '../widgets/paymentwidget.dart';
import 'emptycard.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomAppBar(
        title: 'Payment Method',
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 76),
              child: (payments["1"]!.isNotEmpty)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: payments["1"]!.length,
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 24),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            PaymentWidget(
                              state: payments["1"]![index]["paymentMethod"],
                              cardnumber: "${payments["1"]![index]["card"]}",
                              onTap: () {
                                setState(() {
                                  payments["1"]!.removeAt(index);
                                  Navigator.pop(context);
                                });
                              },
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
                      Navigator.pushReplacementNamed(context, "addcard");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
