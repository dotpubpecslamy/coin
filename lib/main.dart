import 'package:coin/bloc/coin_bloc/coin_bloc.dart';
import 'package:coin/data/repository/coin_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CoinRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CoinBloc(
              coinRepository: RepositoryProvider.of<CoinRepository>(context),
            )..add(FetchCoinsList()),
          ),
        ],
        child: MaterialApp(
          title: 'Coin',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
