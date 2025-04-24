import 'package:crypto_management_task/domain/entities/entity.dart';

base class Coin extends Entity {
  final String name;
  final double price;
  final String symbol;
  final String iconAddress;
  final bool isFavorite;

  Coin({
    required super.id,
    required super.createdAt,
    required this.name,
    required this.price,
    required this.symbol,
    required this.iconAddress,
    required this.isFavorite,
  });

  Coin copyWith({
    int? id,
    int? createdAt,
    String? name,
    double? price,
    String? symbol,
    String? iconAddress,
    bool? isFavorite,
  }) {
    return Coin(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      price: price ?? this.price,
      symbol: symbol ?? this.symbol,
      iconAddress: iconAddress ?? this.iconAddress,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
