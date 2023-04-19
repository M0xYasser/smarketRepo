import 'package:flutter/material.dart';

class MarketWidget extends StatelessWidget {
  final String pic, productName, size, price, quantity;

  const MarketWidget(
      {super.key,
      required this.pic,
      required this.productName,
      required this.size,
      required this.price,
      required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Center(
            child: Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff68B2A0), Color(0xff89B6BF)],
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            productName,
                            style: const TextStyle(
                              fontFamily: "harabaraBold",
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            size,
                            style: const TextStyle(
                              fontFamily: "harabaraBold",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$price L.E",
                            style: const TextStyle(
                              fontFamily: "harabaraBold",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "x$quantity",
                          style: const TextStyle(
                            fontFamily: "harabaraBold",
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  Image.network(
                    pic,
                    height: 80,
                    width: 70,
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              )
            ],
          )
        ],
      ),
    );
  }
}
