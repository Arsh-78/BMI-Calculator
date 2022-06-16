import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String caculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5 && _bmi < 25.0) {
      return 'Normal';
    }
    return 'Underweight';
  }

  String getComment() {
    if (_bmi >= 25) {
      return 'You are overweight,please workout a bit';
    } else if (_bmi > 18.5 && _bmi < 25.0) {
      return 'You are normal, but working out can mean no harm so go for it';
    }
    return 'You are Underweight,Please workout for a healthier LifeStyle';
  }
}
