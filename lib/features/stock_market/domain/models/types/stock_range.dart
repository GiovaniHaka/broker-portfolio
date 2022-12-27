// ignore_for_file: constant_identifier_names

const _1d = '1d';
const _5d = '5d';
const _1mo = '1mo';
const _3mo = '3mo';
const _6mo = '6mo';
const _1y = '1y';
const _2y = '2y';
const _5y = '5y';
const _10y = '10y';
const _ytd = 'ytd';
const _max = 'max';

enum StockRange {
  oneDay(_1d),
  fiveDay(_5d),
  oneMonth(_1mo),
  threeMonth(_3mo),
  sixMonth(_6mo),
  oneYear(_1y),
  twoYear(_2y),
  fiveYear(_5y),
  tenYear(_10y),
  ytd(_ytd),
  maxRange(_max);

  final String value;

  const StockRange(this.value);

  static fromString(String str) {
    switch (str) {
      case _1d:
        return oneDay;
      case _5d:
        return fiveDay;
      case _1mo:
        return oneMonth;
      case _3mo:
        return threeMonth;
      case _6mo:
        return sixMonth;
      case _1y:
        return oneYear;
      case _2y:
        return twoYear;
      case _5y:
        return fiveYear;
      case _10y:
        return tenYear;
      case _ytd:
        return ytd;
      case _max:
        return maxRange;
      default:
        throw UnimplementedError('Case $str not implemented');
    }
  }
}
