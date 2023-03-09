// ignore_for_file: non_constant_identifier_names

class CoinOHLCV {
  DateTime time_open;
  DateTime time_close;
  double open;
  double high;
  double low;
  double close;
  int volume;
  int market_cap;

  CoinOHLCV({
    required this.time_open,
    required this.time_close,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.market_cap,
  });

  factory CoinOHLCV.fromMap(Map<String, dynamic> map) {
    return CoinOHLCV(
      time_open: DateTime.parse(map['time_open']),
      time_close: DateTime.parse(map['time_close']),
      open: map['open'],
      high: map['high'],
      low: map['low'],
      close: map['close'],
      volume: map['volume'],
      market_cap: map['market_cap'],
    );
  }
}
