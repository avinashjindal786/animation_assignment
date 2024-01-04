



import 'package:flutter/material.dart';

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(2, 2), spreadRadius: 0, blurRadius: 8)],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "Order Details",
          style: TextStyle(color: Color(0xFF959a99), fontSize: 24),
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bonsai Plant",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
            Text(
              "\$38.99",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Plant Fertillizer",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
            Text(
              "\$18.99",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Plant Soil",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
            Text(
              "\$12.99",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Subtotal",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
            SizedBox(
              width: 44,
            ),
            Text(
              "\$71.99",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Shipping ",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
            SizedBox(
              width: 44,
            ),
            Text(
              "\$9.99",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Tax ",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
            SizedBox(
              width: 44,
            ),
            Text(
              "\$8.99",
              style: TextStyle(color: Color(0xFF565d5d), fontSize: 16),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              "\$99.99",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ]),
    );
  }
}
