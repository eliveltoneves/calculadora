import 'package:calculadora/widgets/button_hub.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class CalcController extends ChangeNotifier {
  var display = "0";
  final Parser expressionParser = Parser();
  final ContextModel contextModel = ContextModel();

  void onButtonClick(ButtonClick click) {
    if (display == '0') {
      display = '';
    }

    if (click is CommonButtonClick) {
      display += click.value;
    } else if (click is ClearButtonClick) {
      display = '0';
    } else if (click is ClearEntryButtonClick) {
      display = '0';
    } else if (click is EqualsButtonClick) {
      try {
        final expression = expressionParser.parse(display);
        final result = expression.evaluate(EvaluationType.REAL, contextModel);
        display = formatResult(result);
      } catch (e) {
        display = 'Error';
      }
    }
    notifyListeners();
  }

  String formatResult(double result) {
    if (result % 1 == 0) {
      // Se o resultado for um número inteiro, não exibe as casas decimais
      return result.toInt().toString();
    } else {
      // Caso contrário, exibe as casas decimais normalmente
      final formattedResult = NumberFormat.decimalPattern().format(result);
      return formattedResult;
    }
  }
}
