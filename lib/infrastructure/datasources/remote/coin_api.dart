import 'package:crypto_management_task/application/dtos/toggle_favorite_coin_dto.dart';
import 'package:crypto_management_task/core/constants/api_constants.dart';
import 'package:crypto_management_task/core/network/api_service.dart';
import 'package:crypto_management_task/infrastructure/models/coin_model.dart';
import 'package:crypto_management_task/core/error/app_exception.dart';
import 'package:crypto_management_task/infrastructure/models/favorite_coin_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CoinApi {
  final ApiService _apiService;

  CoinApi(@Named('coin') this._apiService);

  Future<List<CoinModel>> getAllCoins() async {
    try {
      final response = await _apiService.get(ApiConstants.coins);

      if (response.statusCode == 200) {
        final List<dynamic> coinsJson = response.data;

        return coinsJson.map((json) => CoinModel.fromJson(json)).toList();
      } else {
        throw UnknownException();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FavoriteCoinModel>> getAllFavouriteCoins() async {
    try {
      final response = await _apiService.get(ApiConstants.favorites);

      if (response.statusCode == 200) {
        final List<dynamic> favoriteCoinsJson = response.data;
        return favoriteCoinsJson
            .map((json) => FavoriteCoinModel.fromJson(json))
            .toList();
      } else {
        throw UnknownException();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteFavoriteCoin(ToggleFavoriteCoinDto coinId) async {
    try {
      await _apiService.delete(ApiConstants.favorites, data: coinId.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteCoinModel> addFavoriteCoin(
    ToggleFavoriteCoinDto coinId,
  ) async {
    try {
      final response = await _apiService.post(
        ApiConstants.favorites,
        data: coinId.toJson(),
      );

      if (response.statusCode == 200) {
        final favoriteCoinJson = response.data;
        return FavoriteCoinModel.fromJson(favoriteCoinJson);
      } else {
        throw UnknownException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
