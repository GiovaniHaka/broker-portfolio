// ignore_for_file: constant_identifier_names

const _1m = '1m';
const _2m = '2m';
const _5m = '5m';
const _15m = '15m';
const _30m = '30m';
const _60m = '60m';
const _90m = '90m';
const _1d = '1d';
const _5d = '5d';
const _1wk = '1wk';
const _1mo = '1mo';
const _3mo = '3mo';

enum StockInterval {
  oneMinute(_1m),
  twoMinute(_2m),
  fiveMinute(_5m),
  fifteenMinute(_15m),
  thirtyMinute(_30m),
  sixtyMinute(_60m),
  ninetyMinute(_90m),
  oneDay(_1d),
  fiveDay(_5d),
  oneWeek(_1wk),
  oneMonth(_1mo),
  threeMonth(_3mo);

  final String value;

  const StockInterval(this.value);

  static fromString(String str) {
    switch (str) {
      case _1m:
        return oneMinute;
      case _2m:
        return twoMinute;
      case _5m:
        return fiveMinute;
      case _15m:
        return fifteenMinute;
      case _30m:
        return thirtyMinute;
      case _60m:
        return sixtyMinute;
      case _90m:
        return ninetyMinute;
      case _1d:
        return oneDay;
      case _5d:
        return fiveDay;
      case _1wk:
        return oneWeek;
      case _1mo:
        return oneMonth;
      case _3mo:
        return threeMonth;
      default:
        throw UnimplementedError('Case $str not implemented');
    }
  }
}
