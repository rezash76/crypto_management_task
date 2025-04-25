import 'package:crypto_management_task/application/dtos/toggle_favorite_coin_dto.dart';
import 'package:crypto_management_task/domain/entities/coin.dart';
import 'package:crypto_management_task/domain/entities/favorite_coin.dart';
import 'package:crypto_management_task/domain/repositories/coin_ropository.dart';
import 'package:crypto_management_task/infrastructure/datasources/remote/coin_api.dart';
import 'package:crypto_management_task/infrastructure/mappers/coin_mapper.dart';
import 'package:crypto_management_task/infrastructure/mappers/favorite_coin_mapper.dart';
import 'package:injectable/injectable.dart';

/// Implementation of [CoinRepository] for managing coin and favorite coin operations.
///
/// Acts as an abstraction layer between the domain and data sources, handling
/// coin-related API communication via [CoinApi]. Provides methods for retrieving
/// all coins, managing favorites, and ensures business logic is decoupled from infrastructure.
@LazySingleton(as: CoinRepository)
class CoinRepositoryImpl implements CoinRepository {
  final CoinApi _coinApi;

  CoinRepositoryImpl(this._coinApi);

  @override
  Future<List<Coin>> getAllCoins() async {
    try {
      final coinModels = await _coinApi.getAllCoins();
      return coinModels.map((coinModel) => coinModel.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FavoriteCoin>> getAllFavouriteCoins() async {
    try {
      final faveCoinModels = await _coinApi.getAllFavouriteCoins();
      return faveCoinModels
          .map((faveCoinModel) => faveCoinModel.toEntity())
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleFavorite({
    required ToggleFavoriteCoinDto toggleFaveCoinDto,
  }) async {
    try {
      if (toggleFaveCoinDto.isFavorite) {
        await _coinApi.deleteFavoriteCoin(toggleFaveCoinDto);
      } else {
        await _coinApi.addFavoriteCoin(toggleFaveCoinDto);
      }
    } catch (e) {
      rethrow;
    }
  }
}
