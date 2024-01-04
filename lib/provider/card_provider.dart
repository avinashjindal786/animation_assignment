import 'package:animation_project/model/card_detail_model.dart';
import 'package:flutter/material.dart';

class CardsDetailProvider extends ChangeNotifier {
  bool _addCard = false;
  bool get addCard => _addCard;

  final List<CardDetailModel> _cardList = [];
  List<CardDetailModel> get cardList => _cardList;

  changeStatus(bool val) {
    _addCard = val;
    notifyListeners();
  }

  addCardFunc(CardDetailModel model) {
    _cardList.add(model);
    notifyListeners();
  }
}
