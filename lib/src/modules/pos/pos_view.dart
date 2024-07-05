import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pos/src/data/models/pos_view_model.dart';

class PosView extends StatelessWidget {
  const PosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PosViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TCC POS'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: Consumer<PosViewModel>(
                        builder: (context, model, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('สมาชิก: 084-394-3443'),
                              ),
                              const Divider(),
                              buildInfoRow(context, 'ยอดรวม', model.inputValue,
                                  Colors.blue),
                              buildInfoRow(context, 'ส่วนลด', '0', Colors.blue),
                              buildInfoRow(context, 'ยอดชำระ:',
                                  model.inputValue, Colors.blue),
                              buildInfoRow(
                                  context, 'เงินสด', '0', Colors.black),
                              const Divider(),
                              buildInfoRow(
                                  context, 'ยอดค้างชำระ:', '0', Colors.red),
                              buildInfoRow(
                                  context, 'เงินทอน', '0', Colors.black),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildBottomButton('กลับ'),
                                  buildBottomButton('จบการขายรับใบเสร็จ'),
                                  buildBottomButton('จบการขายไม่รับใบเสร็จ'),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<PosViewModel>(
                      builder: (context, model, child) {
                        return Column(
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
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                model.inputValue,
                                style: const TextStyle(fontSize: 20),
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
                                        buildNumberButton(
                                            '20', model, Colors.green),
                                        buildNumberButton(
                                            '50', model, Colors.blue),
                                        buildNumberButton(
                                            '100', model, Colors.red),
                                        buildNumberButton(
                                            '500', model, Colors.purple),
                                        buildNumberButton(
                                            '1000', model, Colors.grey),
                                        buildFixedButton(
                                            'รับเงินพอดี', Colors.cyan),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: GridView.count(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 1.5,
                                      children: [
                                        buildNumberButton('7', model),
                                        buildNumberButton('8', model),
                                        buildNumberButton('9', model),
                                        buildNumberButton('4', model),
                                        buildNumberButton('5', model),
                                        buildNumberButton('6', model),
                                        buildNumberButton('1', model),
                                        buildNumberButton('2', model),
                                        buildNumberButton('3', model),
                                        buildNumberButton('0', model),
                                        buildNumberButton('00', model),
                                        buildNumberButton('.', model),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: buildSpecialButton(
                                            Icons.backspace,
                                            model.onDeletePress),
                                      ),
                                      Expanded(
                                        child: buildSpecialButtonText(
                                            'ตกลง', model.submitInput),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(method),
    );
  }

  Widget buildNumberButton(String number, PosViewModel model, [Color? color]) {
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
      child: Text(number),
    );
  }

  Widget buildFixedButton(String label, Color color) {
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
      child: Text(label),
    );
  }

  Widget buildBottomButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(label),
    );
  }

  Widget buildSpecialButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
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

  Widget buildInfoRow(
      BuildContext context, String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: color, fontSize: 18),
          ),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
