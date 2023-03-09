import 'package:coin/data/util/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:coin/data/model/coin_details_args.dart';
import 'package:coin/routes/route_names.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin/bloc/coin_bloc/coin_bloc.dart';
import 'package:intl/intl.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PogiCoin'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.read<CoinBloc>().add(FetchCoinsList()),
          icon: const Icon(Icons.refresh),
        ),
        actions: const [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Icon(CupertinoIcons.person_alt, size: 70, color: Colors.grey),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Top Coins'),
                Text(Util.getFormattedDate(DateTime.now())),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocConsumer<CoinBloc, CoinState>(
                listenWhen: (previous, current) => current != Loading(),
                listener: (context, state) {
                  if (state is CoinsDetailsFetched) {
                    Navigator.pushNamed(
                      context,
                      RouteNames.conDetails,
                      arguments: CoinDetailsArgs(coin: state.currentCoin, coinOHLCV: state.coinOHLCV, price: state.price),
                    ).whenComplete(() {
                      context.read<CoinBloc>().add(ResetState(coins: state.coins));
                    });
                  }
                },
                builder: (context, state) {
                  if (state is CoinBlocError) {
                    return Center(child: Text(state.error));
                  }

                  if (state is CoinsFetched) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemCount: 30,
                      itemBuilder: (contxt, i) {
                        return GestureDetector(
                          onTap: () => context.read<CoinBloc>().add(FetchCoinDetails(coin: state.coins[i], coins: state.coins)),
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.coins[i].name),
                                  Text(state.coins[i].rank.toString()),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(child: CircularProgressIndicator.adaptive());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
