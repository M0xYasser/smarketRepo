import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarket_app/presentation/screens/save_money.dart';
import 'package:smarket_app/presentation/screens/search.dart';
import '../widgets/market_widget.dart';
import 'homeScreen.dart';
import 'market_empty.dart';

class CartProduct1 extends StatefulWidget {
  const CartProduct1({super.key});

  @override
  CartProduct1State createState() => CartProduct1State();
}

class CartProduct1State extends State<CartProduct1> {
  Future openPop() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/warning.svg",
                  height: 30,
                  width: 30,
                ),
                const Text(
                  "Warning!",
                  style: TextStyle(
                    fontFamily: "harabaraBold",
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: 80,
              width: 250,
              child: Column(
                children: const <Widget>[
                  Text(
                    "Are you sure you want to leave?",
                    style: TextStyle(
                      fontFamily: "harabara",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "If you choose leave you will lose all your data",
                    style: TextStyle(
                      fontFamily: "harabara",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 36,
                          width: 84,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xff2c6976),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  children: const <Widget>[
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      "Leave",
                                      style: TextStyle(
                                        fontFamily: "harabaraBold",
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 36,
                          width: 84,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: const Color(0xff888888)),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  children: const <Widget>[
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      "Cancle",
                                      style: TextStyle(
                                          fontFamily: "harabaraBold",
                                          fontSize: 16,
                                          color: Color(0xff888888)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]),
      );

  List productList = [];
  getProductsList() async {
    final response = await http.get(Uri.parse(
        'https://smartcartapplication.azurewebsites.net/Product/GetProductCart?cartId=$userqr&userId=${userId.toString()}'));
    if (mounted) {
      setState(() {
        if (response.body.isNotEmpty) {
          productList = json.decode(response.body);
          print(productList);
        }
      });
    }
  }

  int userId = 0;
  String userqr = "";
  getUseId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');
    String? qr = prefs.getString('qr');
    setState(() {
      userId = id!;
      userqr = qr!;
    });
  }

  @override
  void initState() {
    getUseId();
    var timer = Timer.periodic(Duration(seconds: 3), (timer) {
      getProductsList();
      print("qr1-----$userqr------");
      print("userId1-----${userId.toString()}------");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
        title: const Text(
          "Your Cart",
          style: TextStyle(
            color: Color(0xff444444),
            fontFamily: "harabara",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Home(),
                ));
              },
              child: Row(children: <Widget>[
                SvgPicture.asset("assets/icons/back.svg"),
              ]),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Row(
              children: [
                InkWell(
                    onTap: () =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SaveMoney(),
                        )),
                    child: SvgPicture.asset("assets/icons/saveMoney.svg")),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: const Color(0xff737373),
                          child: Container(
                            height: 220,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                )),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 28, 150, 0),
                                  child: Text(
                                    "Search For a product",
                                    style: TextStyle(
                                        fontFamily: "harabaraBold",
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 40, right: 40, top: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Color(0xff2c6976)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff2c6976)),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff2c6976)),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        label: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              ("Search"),
                                              style: TextStyle(
                                                  fontFamily: "harabaraBold",
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),
                                        suffixIcon: const Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Icon(
                                            Icons.search,
                                            color: Color(0xff2c6976),
                                          ),
                                        ),
                                      ),
                                      cursorColor: const Color(0xff2c6976),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 0, 40, 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 36,
                                            width: 84,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff888888)),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: Row(
                                                    children: const <Widget>[
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text(
                                                        "Cancle",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "harabaraBold",
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 36,
                                            width: 84,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: const Color(0xff2c6976),
                                            ),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SearchScrean()));
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Row(
                                                    children: const <Widget>[
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text(
                                                        "Search",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "harabaraBold",
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Row(children: <Widget>[
                    // SvgPicture.asset("assets/icons/search.svg"),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Your Money",
                        style: TextStyle(
                          fontFamily: "harabaraBold",
                          fontSize: 17,
                          color: Color.fromARGB(225, 44, 104, 118),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 28,
                        width: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xff68B2A0),
                        ),
                        child: const Center(
                          child: Text(
                            "200 L.E",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: "harabara"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: (productList.isNotEmpty)
                ? ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          MarketWidget(
                            pic: "${productList[index]["productDetail"]}",
                            productName: "${productList[index]["productName"]}",
                            size: "${productList[index]["productName"]}",
                            price: "${productList[index]["productPrice"]}",
                            quantity: "${productList[index]["productAmount"]}",
                          )
                        ],
                      );
                    })
                : const EmptyMarket(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff68B2A0), Color(0xff89B6BF)],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Sub Total",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "harabaraBold",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "39.5 L.E",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "harabaraBold",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () async {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SvgPicture.asset("assets/icons/checkout.svg"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    "Chechout",
                                    style: TextStyle(
                                      fontFamily: "harabaraBold",
                                      fontSize: 20,
                                      color: Color(0xff2c6976),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
