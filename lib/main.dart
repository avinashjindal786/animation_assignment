import 'package:animation_project/provider/card_provider.dart';
import 'package:animation_project/screen/checkout_screen.dart';
import 'package:animation_project/screen/processing_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/add_card/add_card_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CardsDetailProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CheckoutScreen(),
      ),
    );
  }
}
