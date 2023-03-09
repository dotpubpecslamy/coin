import 'dart:async';

import 'package:dio/dio.dart';

import '../../global/constants.dart';
import '../model/coin.dart';

class CoinRepository {
  final _dio = Dio();

  final _baseUrl = Constants.baseUrl;

  Future<List<Coin>> getCoinsList() async {
    final String url = '$_baseUrl/coins';
    try {
      final response = await _dio.get(url).timeout(
        const Duration(seconds: 30),
        onTimeout: () async {
          throw TimeoutException('Timeout');
        },
      );

      if (response.statusCode != 200) throw Exception(response.statusCode);

      final coins = response.data.map((coin) => Coin.fromMap(coin)).toList();

      return List<Coin>.from(coins);
    } catch (exc) {
      throw Exception(exc);
    }
  }

  Future<List<Response>> getCoinDetails(String coinId) async {
    final String url1 = '$_baseUrl/coins/$coinId/ohlcv/today';
    final String url2 = '$_baseUrl/tickers/$coinId';

    try {
      final response = await Future.wait([_dio.get(url1), _dio.get(url2)]);

      print(response[0]);
      print(response[1]);

      return response;
    } catch (exc) {
      throw Exception(exc);
    }
  }
}
