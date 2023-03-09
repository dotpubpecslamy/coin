// ignore_for_file: non_constant_identifier_names

class Coin {
  String id;
  String name;
  String symbol;
  int rank;
  bool is_new;
  bool is_active;
  String type;

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.is_new,
    required this.is_active,
    required this.type,
  });

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      id: map['id'],
      name: map['name'],
      symbol: map['symbol'],
      rank: map['rank'],
      is_new: map['is_new'],
      is_active: map['is_active'],
      type: map['type'],
    );
  }
}
