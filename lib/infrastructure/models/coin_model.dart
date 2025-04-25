import 'package:crypto_management_task/domain/entities/coin.dart';

/// Data model representing a coin as received from or sent to external sources (e.g. APIs).
///
/// Provides factory constructors for mapping from JSON and from the domain [Coin] entity.
/// Acts as a bridge between the data/infrastructure layer and the domain layer,
/// enabling serialization, deserialization, and conversion between different representations.
class CoinModel {
  final int id;
  final int createdAt;
  final String name;
  final double price;
  final String symbol;
  final String? iconAddress;
  final bool isFavorite;

  CoinModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.price,
    required this.symbol,
    required this.iconAddress,
    required this.isFavorite,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      price: json['price'],
      symbol: json['symbol'],
      iconAddress: json['icon_address'],
      isFavorite: json['is_favorite'],
    );
  }

  factory CoinModel.fromEntity(Coin coin) {
    return CoinModel(
      id: coin.id,
      name: coin.name,
      price: coin.price,
      symbol: coin.symbol,
      iconAddress: coin.iconAddress,
      isFavorite: coin.isFavorite,
      createdAt: coin.createdAt,
    );
  }
}
