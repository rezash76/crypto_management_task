import 'package:crypto_management_task/infrastructure/models/coin_model.dart';
import 'package:crypto_management_task/domain/entities/coin.dart';

/// Extension to map a [CoinModel] (data/model layer) to a [Coin] domain entity.
///
/// Facilitates conversion between infrastructure models and domain entities,
/// ensuring separation of concerns and clean data flow across layers.
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
