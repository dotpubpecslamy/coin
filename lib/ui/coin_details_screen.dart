import 'package:coin/data/model/coin_ohlcv.dart';
import 'package:flutter/material.dart';

import '../data/model/coin.dart';
import '../data/util/date_format.dart';

class CoinDetailsScreen extends StatelessWidget {
  const CoinDetailsScreen({super.key, required this.coin, required this.coinOHLCV, required this.price});

  final Coin coin;
  final CoinOHLCV coinOHLCV;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(Util.getFormattedDate(DateTime.now())),
            const SizedBox(height: 20),
            Flexible(
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(coin.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              Text(coin.symbol),
                              Text('USD $price', style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'High:   ',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '+ ${coinOHLCV.high}',
                                  style: const TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              text: 'Low:   ',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '- ${coinOHLCV.low}',
                                  style: const TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text('Open:   ${coinOHLCV.low}'),
                          const SizedBox(height: 10),
                          Text('Close:   ${coinOHLCV.low}'),
                          const SizedBox(height: 20),
                          Text('Volume:   ${coinOHLCV.volume}'),
                          const SizedBox(height: 20),
                          Text('Market Cap:   ${coinOHLCV.market_cap}'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
