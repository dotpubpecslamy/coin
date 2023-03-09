part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object> get props => [];
}

class FetchCoinsList extends CoinEvent {}

class FetchCoinDetails extends CoinEvent {
  final Coin coin;
  final List<Coin> coins;

  const FetchCoinDetails({required this.coin, required this.coins});
}

class ResetState extends CoinEvent {
  final List<Coin> coins;

  const ResetState({required this.coins});
}
