doubleToCurrency(double value) {
  final strValue = value.toStringAsFixed(2);
  const currency = 'R\$';

  return '$currency $strValue';
}
