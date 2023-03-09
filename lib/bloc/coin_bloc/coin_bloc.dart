import 'package:coin/data/model/coin_ohlcv.dart';
import 'package:coin/data/repository/coin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/coin.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository coinRepository;

  CoinBloc({required this.coinRepository}) : super(Loading()) {
    on<FetchCoinsList>((event, emit) async {
      emit(Loading());
      try {
        final coins = await coinRepository.getCoinsList();

        emit(CoinsFetched(coins: coins));
      } catch (exc) {
        emit(CoinBlocError(exc.toString()));
      }
    });

    on<FetchCoinDetails>((event, emit) async {
      emit(Loading());
      try {
        final coinDetails = await coinRepository.getCoinDetails(event.coin.id);

        final ohlcvDetails = CoinOHLCV.fromMap(coinDetails[0].data[0]);
        final price = coinDetails[1].data['quotes']['USD']['price'];

        emit(CoinsDetailsFetched(coinOHLCV: ohlcvDetails, currentCoin: event.coin, coins: event.coins, price: price));
      } catch (exc) {
        emit(CoinsFetched(coins: event.coins));
      }
    });

    on<ResetState>((event, emit) async {
      emit(CoinsFetched(coins: event.coins));
    });
  }
}
