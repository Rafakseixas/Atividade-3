import 'package:flutter/material.dart';
import '../widgets/display.dart';
import '../widgets/button_number.dart';
import '../widgets/button_operation.dart';
import '../utils/calculator_logic.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = '';
  String history = '';
  double firstNumber = 0;
  String operation = '';

  void addNumber(String n) {
    setState(() {
      display += n;
    });
  }

  void setOperation(String op) {
    if (display.isEmpty) return;

    setState(() {
      firstNumber = double.parse(display);
      operation = op;
      display = '';
    });
  }

  void calculateResult() {
    if (display.isEmpty || operation.isEmpty) return;

    double secondNumber = double.parse(display);
    double result = calculate(firstNumber, secondNumber, operation);

    setState(() {
      history =
          "$firstNumber $operation $secondNumber = $result\n$history";

      display = result.toString();
      operation = '';
    });
  }

  void clear() {
    setState(() {
      display = '';
      history = '';
      firstNumber = 0;
      operation = '';
    });
  }

  Widget buildRow(List<Widget> children) {
    return Row(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Calculadora'),
      ),
      body: Column(
        children: [
          Display(
            text: display,
            history: history,
          ),

          const Spacer(),

          buildRow([
            NumberButton(text: '7', onPressed: () => addNumber('7')),
            NumberButton(text: '8', onPressed: () => addNumber('8')),
            NumberButton(text: '9', onPressed: () => addNumber('9')),
            OperationButton(text: '/', onPressed: () => setOperation('/')),
          ]),

          buildRow([
            NumberButton(text: '4', onPressed: () => addNumber('4')),
            NumberButton(text: '5', onPressed: () => addNumber('5')),
            NumberButton(text: '6', onPressed: () => addNumber('6')),
            OperationButton(text: '*', onPressed: () => setOperation('*')),
          ]),

          buildRow([
            NumberButton(text: '1', onPressed: () => addNumber('1')),
            NumberButton(text: '2', onPressed: () => addNumber('2')),
            NumberButton(text: '3', onPressed: () => addNumber('3')),
            OperationButton(text: '-', onPressed: () => setOperation('-')),
          ]),

          buildRow([
            OperationButton(text: 'C', onPressed: clear),
            NumberButton(text: '0', onPressed: () => addNumber('0')),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: calculateResult,
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
            OperationButton(text: '+', onPressed: () => setOperation('+')),
          ]),
        ],
      ),
    );
  }
}