

// To parse this JSON data, do
//
//     final cardDetailModel = cardDetailModelFromJson(jsonString);

import 'dart:convert';

CardDetailModel cardDetailModelFromJson(String str) => CardDetailModel.fromJson(json.decode(str));

String cardDetailModelToJson(CardDetailModel data) => json.encode(data.toJson());

class CardDetailModel {
  String? name;
  String? cardNumber;
  String? exDate;
  String? zipCode;

  CardDetailModel({
    this.name,
    this.cardNumber,
    this.exDate,
    this.zipCode,
  });

  factory CardDetailModel.fromJson(Map<String, dynamic> json) => CardDetailModel(
        name: json["name"],
        cardNumber: json["card_number"],
        exDate: json["exDate"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "card_number": cardNumber,
        "exDate": exDate,
        "zipCode": zipCode,
      };
}
