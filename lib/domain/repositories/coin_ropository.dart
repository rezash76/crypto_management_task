import 'package:crypto_management_task/application/dtos/toggle_favorite_coin_dto.dart';
import 'package:crypto_management_task/domain/entities/coin.dart';
import 'package:crypto_management_task/domain/entities/favorite_coin.dart';

abstract interface class CoinRepository {
  Future<List<Coin>> getAllCoins();
  Future<List<FavoriteCoin>> getAllFavouriteCoins();
  Future<void> toggleFavorite({
    required ToggleFavoriteCoinDto toggleFaveCoinDto,
  });
}
