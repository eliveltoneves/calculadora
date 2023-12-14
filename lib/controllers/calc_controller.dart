import 'package:calculadora/widgets/button_hub.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcController extends ChangeNotifier {
  var display = "0";
  final Parser expressionParser = Parser();
  final ContextModel contextModel = ContextModel();

  void onButtonClick(ButtonClick click) {
    if (display == '0') {
      display = '';
    }

    if (click is CommonButtonClick) {
      handleCommonButtonClick(click);
    } else if (click is ClearButtonClick) {
      clearDisplay();
    } else if (click is ClearEntryButtonClick) {
      clearEntry();
    } else if (click is EqualsButtonClick) {
      evaluateExpression();
    }
    notifyListeners();
  }

  void handleCommonButtonClick(CommonButtonClick click) {
    if (click.value == '.') {
      handleDecimalInput();
    } else {
      display += click.value;
    }
  }

  void handleDecimalInput() {
  if (display.isEmpty || display.endsWith('+') || display.endsWith('-') || display.endsWith('*') || display.endsWith('/')) {
    // Adiciona 0 à esquerda do ponto se o ponto for o primeiro caractere da expressão
    display += '0.';
  } else if (!display.contains('.')) {
    // Adiciona ponto apenas se não houver ponto na expressão
    display += '.';
  }
}



  void clearEntry() {
    if (display.isNotEmpty) {
      display = display.substring(0, display.length - 1);
      if (display.isEmpty) {
        display = '0';
      }
    }
  }

  void clearDisplay() {
    display = '0';
  }

  void evaluateExpression() {
    try {
      final expression = expressionParser.parse(display);
      final result = expression.evaluate(EvaluationType.REAL, contextModel);
      display = formatResult(result);
    } catch (e) {
      display = 'Error';
    }
  }

  String formatResult(double result) {
    if (result % 1 == 0) {
      return result.toInt().toString();
    } else {
      final formattedResult = NumberFormat.decimalPattern().format(result);
      return formattedResult;
    }
  }
}
