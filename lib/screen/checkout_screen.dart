import 'package:animation_project/provider/card_provider.dart';
import 'package:animation_project/screen/processing_payment_screen.dart';
import 'package:animation_project/widgets/order_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'add_card/add_card_screen.dart';
import 'add_card/widget/card_filled_detail_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool addCard = false;

  int payButtonActive = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardsDetailProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check Out"),
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 250,
            child: provider.addCard
                ? AddCard(
                    width: MediaQuery.sizeOf(context).width,
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(
                            provider.cardList.length,
                            (index) {
                              return ShowDetailCardWidget(
                                name: provider.cardList[index].name ?? "",
                                number: provider.cardList[index].cardNumber ?? "",
                                exDate: provider.cardList[index].exDate ?? "",
                                zipCode: provider.cardList[index].zipCode ?? "",
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 250,
                          width: 350,
                          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(color: const Color(0xFFfff8f3), border: Border.all(color: const Color(0xFFfde2d2), width: 1.5), borderRadius: BorderRadius.circular(12)),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                            InkWell(
                              onTap: () {
                                provider.changeStatus(true);
                              },
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xFFb86737),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Color(0xFFd3a082),
                                  size: 35,
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              "Add a new card",
                              style: TextStyle(color: Color(0xFFb86737), fontSize: 18),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: OrderDetailWidget(),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentProscessingScreen()));
            },
            child: Hero(
              tag: "color",
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(2, 2), spreadRadius: 0, blurRadius: 8)], color: provider.cardList.isNotEmpty ? const Color(0xFFb86737) : const Color(0xFF929ba2)),
                child: const Center(
                    child: Text(
                  "Pay It",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
