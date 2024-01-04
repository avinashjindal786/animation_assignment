


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDetailCardWidget extends StatelessWidget {
  String name;
  String number;
  String exDate;
  String zipCode;
  ShowDetailCardWidget({
    required this.exDate,
    required this.name,
    required this.number,
    required this.zipCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, top: 12, bottom: 12),
      decoration: BoxDecoration(color: const Color(0xFF385153), borderRadius: BorderRadius.circular(12)),
      height: 250,
      width: 350,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credit Card Number",
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
              ),
              const SizedBox(height: 8),
              Text(
                number,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Card Name",
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
              ),
              const SizedBox(height: 6),
              Text(
                name,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exp. Date",
                        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        exDate,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Zip Code",
                        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        zipCode,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Positioned.fill(
            right: 5,
            bottom: -20,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/294654_visa_icon.png",
                scale: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
