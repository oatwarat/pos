import 'package:flutter_test/flutter_test.dart';
import 'package:pos/src/data/models/pos_view_model.dart';

void main() {
  group('PosViewModel Test', () {
    test('initial selected method should be empty', () {
      final viewModel = PosViewModel();
      expect(viewModel.selectedMethod, '');
    });

    test('setSelectedMethod should update selectedMethod', () {
      final viewModel = PosViewModel();
      viewModel.setSelectedMethod('เงินสด');
      expect(viewModel.selectedMethod, 'เงินสด');
    });

    test('addToInput should update inputValue', () {
      final viewModel = PosViewModel();
      viewModel.addToInput('50');
      expect(viewModel.inputValue, '50.00');
    });

    test('onNumberPress should update inputValue', () {
      final viewModel = PosViewModel();
      viewModel.onNumberPress('7');
      expect(viewModel.inputValue, '7.00');
    });

    test('clearInput should reset inputValue', () {
      final viewModel = PosViewModel();
      viewModel.addToInput('50');
      viewModel.clearInput();
      expect(viewModel.inputValue, '0.00');
    });
  });
}
