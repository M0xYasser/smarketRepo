import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/billingwidget.dart';
import '../widgets/customAppBar.dart';
import '../../data/models/billingdetails.dart';
import 'emptycard.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
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
              child: (billing["1"]!.isNotEmpty)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: billing["1"]!.length,
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 24),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            BillingWidget(
                              state: billing["1"]![index]["billingSetting"],
                              cardnumber: "${billing["1"]![index]["card"]}",
                              onTap: () {
                                setState(() {
                                  billing["1"]!.removeAt(index);
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
