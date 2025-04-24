import 'package:crypto_management_task/domain/entities/favorite_coin.dart';
import 'package:crypto_management_task/infrastructure/models/favorite_coin_model.dart';

extension FavoriteCoinModelMapper on FavoriteCoinModel {
  FavoriteCoin toEntity() {
    return FavoriteCoin(
      id: id,
      createdAt: createdAt,
      userId: userId,
      cryptocurrencyId: cryptocurrencyId,
    );
  }
}
