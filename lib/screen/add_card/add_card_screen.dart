import 'dart:async';

import 'package:animation_project/model/card_detail_model.dart';
import 'package:animation_project/provider/card_provider.dart';
import 'package:animation_project/screen/add_card/widget/text_field_widget.dart';
import 'package:animation_project/widgets/on_complete_animation.dart';
import 'package:animation_project/widgets/threedots.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  double width;
  AddCard({required this.width});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> with TickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    sequenceAnimation = SequenceAnimationBuilder().addAnimatable(animatable: ColorTween(begin: const Color(0xFF385153), end: const Color(0xFF385153)), from: const Duration(seconds: 0), to: const Duration(seconds: 1), tag: "color").addAnimatable(animatable: Tween<double>(begin: 10.0, end: 280.0), from: const Duration(seconds: 0), to: const Duration(milliseconds: 1000), tag: "height", curve: Curves.ease).addAnimatable(animatable: Tween<double>(begin: 10.0, end: widget.width), from: const Duration(seconds: 0), to: const Duration(milliseconds: 1000), tag: "width", curve: Curves.easeIn).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TextEditingController cardNumber = TextEditingController();
  TextEditingController securityCode = TextEditingController();
  TextEditingController cardHolder = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  bool showCardType = false;
  bool submitCardForm = false;
  bool submit = false;
  bool showLoading = false;

  bool processingComplete = false;

  // function for verify the card details
  // after 4 sec show successfully added animation
  verifyFunction(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        processingComplete = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardsDetailProvider>(context);
    return AnimatedBuilder(
      builder: (context, child) {
        return Center(
          child: Container(
            height: sequenceAnimation["height"].value,
            width: sequenceAnimation["width"].value,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(color: sequenceAnimation["color"].value, borderRadius: BorderRadius.circular(12)),
            child: sequenceAnimation["width"].value > 320
                // show loading and after 4 second show successfully added animation
                ? submit
                    ? processingComplete
                        ?  Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OnCompleteAnimation(color: const Color(0xFFb86737),iconColor: Colors.white,),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  "Successfully Added!!",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ThreeDots(activeColor: const Color(0xFFb46d42),inactiveColor: const Color(0xFF6f8081),),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  "Verifying Your Card",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                    : Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Row(
                                children: [
                                  // Credit Card TextField with text name
                                  TextFieldWidget(
                                    cardNumber: cardNumber,
                                    name: "Credit Card Number",
                                    limit: 12,
                                    textType: TextInputType.number,
                                    onSubmitted: (p0) {
                                      if (p0!.length == 22) {
                                        setState(() {
                                          showCardType = true;
                                        });
                                      }
                                    },
                                    onChange: (p0) {
                                      if (p0!.length == 22) {
                                        setState(() {
                                          showCardType = true;
                                        });
                                      }
                                    },
                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                    formatter: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(16), CardNumberInputFormatter()],
                                    // maxLength: 12,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  // Security code TextField with text name
                                  TextFieldWidget(
                                    cardNumber: securityCode,
                                    name: "Security Code",
                                    limit: 3,
                                    textType: TextInputType.number,
                                    width: MediaQuery.sizeOf(context).width * 0.2,
                                    // maxLength: 3,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              // Card Holder TextField with text name
                              TextFieldWidget(
                                cardNumber: cardHolder,
                                name: "Card Holder ",
                                limit: 18,
                                textType: TextInputType.text,
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                // maxLength: 3,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  // Exp. Date TextField with text name
                                  TextFieldWidget(
                                    cardNumber: expDate,
                                    name: "Exp. Date",
                                    limit: 5,
                                    textType: TextInputType.name,
                                    width: MediaQuery.sizeOf(context).width * 0.2,
                                    hintText: "MM/YY",
                                    // maxLength: 12,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  // Zip Code TextField with text name
                                  TextFieldWidget(
                                    cardNumber: zipCode,
                                    name: "Zip Code",
                                    limit: 5,
                                    textType: TextInputType.number,
                                    width: MediaQuery.sizeOf(context).width * 0.2,
                                    onSubmitted: (p0) {
                                      if (p0!.isNotEmpty) {
                                        setState(() {
                                          submitCardForm = true;
                                        });
                                      }
                                    },
                                    // maxLength: 3,
                                  ),
                                  const Spacer(),

                                  // Card type image(Visa png)
                                  showCardType
                                      ? Image.asset(
                                          "assets/294654_visa_icon.png",
                                          scale: 8,
                                        )
                                          .animate()
                                          .fadeIn() // uses `Animate.defaultDuration`
                                          .scale() // inherits duration from fadeIn
                                          .move(delay: 100.ms, duration: 600.ms)
                                          .slide()
                                      : const SizedBox(), // runs after the above w/new duration
                                ],
                              ),
                            ]),
                          ),
                          // Submit form button
                          submitCardForm
                              ? Positioned.fill(
                                  right: -10,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            submit = true;
                                          });
                                          provider.addCardFunc(CardDetailModel(name: cardHolder.text, cardNumber: cardNumber.text, exDate: expDate.text, zipCode: zipCode.text));
                                          verifyFunction(context);
                                        },
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: submitCardForm ? const Color(0xFFb46d42) : const Color(0xFF929ba2),
                                          child: Center(
                                              child: !submit
                                                  ? const Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    )
                                                  : const SizedBox()),
                                        ),
                                      )))
                              : const SizedBox()
                        ],
                      )
                : const SizedBox(),
          ),
        );
      },
      animation: controller,
    );
  }
}
