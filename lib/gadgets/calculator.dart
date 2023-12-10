import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';

  void _addToExpression(String value) {
    setState(() {
      _expression += value;
    });
  }

  void _clearExpression() {
    setState(() {
      _expression = '';
    });
  }

  void _evaluateExpression() {
    Parser parser = Parser();
    Expression expression = parser.parse(_expression);
    ContextModel contextModel = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      _expression = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculatrice Scientifique"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            flex: 5,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                CalculatorButton(
                  text: 'C',
                  onTap: _clearExpression,
                  color: Colors.redAccent,
                ),
                CalculatorButton(
                  text: '(',
                  onTap: () => _addToExpression('('),
                ),
                CalculatorButton(
                  text: ')',
                  onTap: () => _addToExpression(')'),
                ),
                CalculatorButton(
                  text: '/',
                  onTap: () => _addToExpression('/'),
                  color: Colors.blueAccent,
                ),
                CalculatorButton(
                  text: '7',
                  onTap: () => _addToExpression('7'),
                ),
                CalculatorButton(
                  text: '8',
                  onTap: () => _addToExpression('8'),
                ),
                CalculatorButton(
                  text: '9',
                  onTap: () => _addToExpression('9'),
                ),
                CalculatorButton(
                  text: '*',
                  onTap: () => _addToExpression('*'),
                  color: Colors.blueAccent,
                ),
                CalculatorButton(
                  text: '4',
                  onTap: () => _addToExpression('4'),
                ),
                CalculatorButton(
                  text: '5',
                  onTap: () => _addToExpression('5'),
                ),
                CalculatorButton(
                  text: '6',
                  onTap: () => _addToExpression('6'),
                ),
                CalculatorButton(
                  text: '-',
                  onTap: () => _addToExpression('-'),
                  color: Colors.blueAccent,
                ),
                CalculatorButton(
                  text: '1',
                  onTap: () => _addToExpression('1'),
                ),
                CalculatorButton(
                  text: '2',
                  onTap: () => _addToExpression('2'),
                ),
                CalculatorButton(
                  text: '3',
                  onTap: () => _addToExpression('3'),
                ),
                CalculatorButton(
                  text: '+',
                  onTap: () => _addToExpression('+'),
                  color: Colors.blueAccent,
                ),
                CalculatorButton(
                  text: '+/-',
                  onTap: () {
                    if (_expression.isNotEmpty) {
                      if (_expression[0] == '-') {
                        setState(() {
                          _expression = _expression.substring(1);
                        });
                      } else {
                        setState(() {
                          _expression = '-' + _expression;
                        });
                      }
                    }
                  },
                ),
                CalculatorButton(
                  text: '0',
                  onTap: () => _addToExpression('0'),
                ),
                CalculatorButton(
                  text: '.',
                  onTap: () => _addToExpression('.'),
                ),
                CalculatorButton(
                  text: '=',
                  onTap: _evaluateExpression,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CalculatorButton({
    required this.text,
    required this.onTap,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[850],

      ),
      child: Center(child: Text(text,style: TextStyle(fontSize: 20,color: Colors.white),))
    );
  }
}

//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


