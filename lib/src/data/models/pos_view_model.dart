import 'package:flutter/material.dart';

class PosViewModel extends ChangeNotifier {
  String selectedMethod = '';
  String inputValue = '0';

  String totalAmount = '0';
  String discount = '0';
  String paymentAmount = '0';
  String cash = '0';
  String outstandingAmount = '0';
  String change = '0';

  void setSelectedMethod(String method) {
    selectedMethod = method;
    notifyListeners();
  }

  void addToInput(String value) {
    inputValue = inputValue == '0' ? value : inputValue + value;
    notifyListeners();
  }

  void clearInput() {
    inputValue = '0';
    notifyListeners();
  }

  void submitInput() {
    // tbd
    notifyListeners();
  }

  void onNumberPress(String number) {
    addToInput(number);
  }

  void onDeletePress() {
    if (inputValue.isNotEmpty) {
      inputValue = inputValue.substring(0, inputValue.length - 1);
      notifyListeners();
    }
  }

  void onClearPress() {
    clearInput();
  }

  String get amountToPay => paymentAmount;
  String get outstanding => outstandingAmount;
}
