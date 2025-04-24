import 'package:crypto_management_task/infrastructure/models/coin_model.dart';
import 'package:crypto_management_task/domain/entities/coin.dart';

extension CoinModelMapper on CoinModel {
  Coin toEntity() {
    return Coin(
      id: id,
      createdAt: createdAt,
      name: name,
      price: price,
      symbol: symbol,
      iconAddress: iconAddress ?? '',
      isFavorite: isFavorite,
    );
  }
}
