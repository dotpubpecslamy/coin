part of 'coin_bloc.dart';

abstract class CoinState extends Equatable {
  const CoinState();
}

class Loading extends CoinState {
  @override
  List<Object?> get props => [];
}

class CoinsFetched extends CoinState {
  final List<Coin> coins;

  const CoinsFetched({required this.coins});

  @override
  List<Object?> get props => [coins];
}

class CoinsDetailsFetched extends CoinState {
  final CoinOHLCV coinOHLCV;
  final Coin currentCoin;
  final List<Coin> coins;
  final double price;

  const CoinsDetailsFetched({required this.coinOHLCV, required this.currentCoin, required this.coins, required this.price});

  @override
  List<Object?> get props => [coinOHLCV, currentCoin, coins];
}

class CoinBlocError extends CoinState {
  final String error;

  const CoinBlocError(this.error);

  @override
  List<Object?> get props => [error];
}
