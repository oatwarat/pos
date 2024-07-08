import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pos/src/data/models/pos_view_model.dart';

class PosView extends StatelessWidget {
  const PosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PosViewModel()..setSelectedMethod('เงินสด'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TCC POS', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF152238), // Dark blue for the app bar
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Add your menu button action here
            },
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Fri 5 Jul',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
        body: Consumer<PosViewModel>(
          builder: (context, model, child) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFF35c5fd), // Blue for สมาชิก section
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                color: const Color(
                                    0xFF35c5fd), // Blue color for สมาชิก section
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'สมาชิก: 084-394-3443',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(4.0),
                                        backgroundColor: Colors.blueAccent,
                                      ),
                                      child: const Text(
                                        'แก้ไข',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: const Color(
                                    0xFFa3e5ff), // Light blue color for the next section
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    buildInfoRow(
                                        context,
                                        'ยอดรวม',
                                        model.inputValue,
                                        Colors.black,
                                        Colors.black),
                                    buildInfoRow(context, 'ส่วนลด', '0.00',
                                        Colors.lightBlue, Colors.lightBlue),
                                    buildInfoRow(
                                        context,
                                        'ยอดชำระ',
                                        model.inputValue,
                                        Colors.black,
                                        Colors.black,
                                        bold: true,
                                        fontSize: 20),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors
                                    .white, // White background for เงินสด and ยอดค้างชำระ
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    buildInfoRow(
                                        context,
                                        'เงินสด',
                                        model.inputValue,
                                        Colors.black,
                                        Colors.black),
                                    buildInfoRow(context, 'ยอดค้างชำระ', '0.00',
                                        Colors.red, Colors.red,
                                        bold: true, fontSize: 20),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: const Color(
                                    0xFFa3e5ff), // Light blue color for the next section
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    buildInfoRow(context, 'เงินทอน', '0.00',
                                        Colors.black, Colors.black),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildBottomButton(
                                'กลับ', Colors.blue, Colors.white),
                            buildBottomButtonWithIcon('จบการขายรับใบเสร็จ',
                                Icons.receipt, Colors.green, Colors.white),
                            buildBottomButtonWithIcon('จบการขายไม่รับใบเสร็จ',
                                Icons.receipt_long, Colors.green, Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildMethodButton(context, 'เงินสด', model),
                            buildMethodButton(context, 'PromptPay', model),
                            buildMethodButton(context, 'ธงฟ้า', model),
                            buildMethodButton(context, 'เป๋าตัง', model),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            model.inputValue,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Flexible(
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 2.5,
                                  children: [
                                    buildNumberButton('20', model, Colors.green,
                                        Colors.white),
                                    buildNumberButton(
                                        '50', model, Colors.blue, Colors.white),
                                    buildNumberButton(
                                        '100', model, Colors.red, Colors.white),
                                    buildNumberButton('500', model,
                                        Colors.purple, Colors.white),
                                    buildNumberButton('1000', model,
                                        Colors.grey, Colors.white),
                                    buildFixedButton('รับเงินพอดี', Colors.cyan,
                                        Colors.white),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: GridView.count(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 1.5,
                                  children: [
                                    buildNumberButton('7', model),
                                    buildNumberButton('8', model),
                                    buildNumberButton('9', model),
                                    buildSpecialButton(
                                        Icons.backspace, model.onDeletePress,
                                        flex: 2),
                                    buildNumberButton('4', model),
                                    buildNumberButton('5', model),
                                    buildNumberButton('6', model),
                                    buildSpecialButtonText(
                                        'ตกลง', model.submitInput),
                                    buildNumberButton('1', model),
                                    buildNumberButton('2', model),
                                    buildNumberButton('3', model),
                                    buildNumberButton('0', model),
                                    buildNumberButton('00', model),
                                    buildNumberButton('.', model),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildMethodButton(
      BuildContext context, String method, PosViewModel model) {
    return ElevatedButton(
      onPressed: () {
        model.setSelectedMethod(method);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            model.selectedMethod == method ? Colors.green : Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(method),
    );
  }

  Widget buildNumberButton(String number, PosViewModel model,
      [Color? color, Color? textColor]) {
    return ElevatedButton(
      onPressed: () {
        model.onNumberPress(number);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: color ?? Colors.grey[200],
      ),
      child: Text(number, style: TextStyle(color: textColor ?? Colors.black)),
    );
  }

  Widget buildFixedButton(String label, Color color, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: color,
      ),
      child: Text(label, style: TextStyle(color: textColor)),
    );
  }

  Widget buildBottomButton(String label, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(label, style: TextStyle(color: textColor)),
    );
  }

  Widget buildBottomButtonWithIcon(
      String label, IconData icon, Color bgColor, Color textColor) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: textColor),
      label: Text(label, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget buildSpecialButton(IconData icon, VoidCallback onPressed,
      {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8.0),
          textStyle: const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.grey[200],
        ),
        child: Icon(icon),
      ),
    );
  }

  Widget buildSpecialButtonText(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: Colors.green,
      ),
      child: Text(text),
    );
  }

  Widget buildInfoRow(BuildContext context, String label, String value,
      Color textColor, Color valueColor,
      {bool bold = false, double fontSize = 18, Color? backgroundColor}) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal),
            ),
            Text(
              value,
              style: TextStyle(
                  color: valueColor,
                  fontSize: fontSize,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
