import 'package:flutter/material.dart';

class PosViewModel extends ChangeNotifier {
  String selectedMethod = '';
  String inputValue = '0.00';

  String totalAmount = '0.00';
  String discount = '0.00';
  String paymentAmount = '0.00';
  String cash = '0.00';
  String outstandingAmount = '0.00';
  String change = '0.00';

  void setSelectedMethod(String method) {
    selectedMethod = method;
    notifyListeners();
  }

  void addToInput(String value) {
    if (inputValue == '0.00') {
      inputValue = value + '.00';
    } else {
      inputValue =
          inputValue.substring(0, inputValue.length - 3) + value + '.00';
    }
    notifyListeners();
  }

  void clearInput() {
    inputValue = '0.00';
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
    if (inputValue.length > 3) {
      inputValue = inputValue.substring(0, inputValue.length - 4) + '.00';
      if (inputValue == '.00') {
        inputValue = '0.00';
      }
    } else {
      inputValue = '0.00';
    }
    notifyListeners();
  }

  void onClearPress() {
    clearInput();
  }

  String get amountToPay => paymentAmount;
  String get outstanding => outstandingAmount;
}
