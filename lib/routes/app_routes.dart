import 'package:flutter/material.dart';

import 'route_names.dart';
import '../data/model/coin_details_args.dart';
import '../ui/coin_list_screen.dart';
import '../ui/coin_details_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case RouteNames.coinLists:
        return MaterialPageRoute(builder: (_) => const CoinListScreen());
      case RouteNames.conDetails:
        CoinDetailsArgs args = arguments as CoinDetailsArgs;
        return MaterialPageRoute(
          builder: (_) => CoinDetailsScreen(
            coin: args.coin,
            coinOHLCV: args.coinOHLCV,
            price: args.price,
          ),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
