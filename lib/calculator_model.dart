class CalculatorModel {
  double calculate(String expression) {
    // Split the expression by spaces assuming format "num1 op num2"
    var parts = expression.split(' ');
    if (parts.length != 3) {
      throw FormatException("Invalid expression format");
    }

    double num1 = double.tryParse(parts[0]) ?? 0.0;
    String operator = parts[1];
    double num2 = double.tryParse(parts[2]) ?? 0.0;

    switch (operator) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        if (num2 == 0) throw FormatException("Division by zero");
        return num1 / num2;
      default:
        throw FormatException("Operator not recognized");
    }
  }
}
