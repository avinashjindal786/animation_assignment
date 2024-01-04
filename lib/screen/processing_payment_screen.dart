import 'package:animation_project/widgets/threedots.dart';
import 'package:flutter/material.dart';

import '../widgets/on_complete_animation.dart';

class PaymentProscessingScreen extends StatefulWidget {
  const PaymentProscessingScreen({super.key});

  @override
  State<PaymentProscessingScreen> createState() => _PaymentProscessingScreenState();
}

class _PaymentProscessingScreenState extends State<PaymentProscessingScreen> {
  bool processingComplete = false;

  verifyFunction(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        processingComplete = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: "color",
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(color: Color(0xFFb86737)),
            child: processingComplete
                ?  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnCompleteAnimation(color: Colors.white,iconColor: const Color(0xFFb86737),),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "Completed!!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                : Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    ThreeDots(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white.withOpacity(0.2),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    const Text(
                      "Processing",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ]),
          )),
    );
  }
}
