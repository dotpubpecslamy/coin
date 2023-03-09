import 'coin.dart';
import 'coin_ohlcv.dart';

class CoinDetailsArgs {
  Coin coin;
  CoinOHLCV coinOHLCV;
  double price;

  CoinDetailsArgs({required this.coin, required this.coinOHLCV, required this.price});
}
