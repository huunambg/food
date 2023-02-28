import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foob_ok/Screens/detail/detail.dart';
import 'package:foob_ok/Screens/home/components/cusstom_appbar.dart';
import 'package:foob_ok/Screens/onbording/onbording.dart';
import 'package:foob_ok/model/data.dart';
import 'package:foob_ok/widgets/custom_bottombar.dart';
import 'package:foob_ok/widgets/custom_button.dart';
import 'package:foob_ok/widgets/custom_text.dart';
import 'package:foob_ok/model/class.dart';
import 'package:ionicons/ionicons.dart';
import 'package:foob_ok/widgets/custom_card.dart';
import 'package:foob_ok/widgets/custom_banner.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // var items;

  late DatabaseHandler handler;
  // add fruit2
  Future<int> addFruit() async {
    List<Fruit> hihi = [];
    final String response = await rootBundle.loadString('assets/Fruits.json');
    var data = jsonDecode(response);
    for (var item in data["Fruits"]) {
      Fruit ob = new Fruit(
          name: item['name'],
          price: item['price'],
          images: item['images'],
          kg: item['kg'],
          detail: item['detail']);
          hihi.add(ob);
    }
    return await this.handler.insertFruit(hihi);
  }

// khoi tao khi Load man hinh
  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
       await this.addFruit();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CusstomAppBar(context),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // form Seach store

                    decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 243, 242, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          label: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.search),
                              SizedBox(
                                width: 5,
                              ),
                              CustomTextGilroy_Bold(text: "Seach store")
                            ],
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  CustomBanner(), //banner
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextGilroy_Medium(text: "Exclusive Offer"),
                      CustomTextBt(
                        text: "See all",
                        onpressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Listviews cua Exclusive Offer
                  CustomCard(handler: handler),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextGilroy_Medium(text: "Best Selling"),
                      CustomTextBt(
                        text: "See all",
                        onpressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Listviews cua Best Selling
                  CustomCard(handler: handler),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextGilroy_Medium(text: "Groceries"),
                CustomTextBt(
                  text: "See all",
                  onpressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //Listviews cua Groceries
            CustomCardMini(hl: handler),
            SizedBox(
              height: 10,
            ),
            CustomCard(handler: handler)
          ],
        ),
        //bottom bar
        bottomNavigationBar: Custom_BottomnavigationBar());
  }
}
