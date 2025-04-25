import 'package:bloc/bloc.dart';
import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/application/dtos/toggle_favorite_coin_dto.dart';
import 'package:crypto_management_task/application/transactions/get_all_coins_transaction.dart';
import 'package:crypto_management_task/application/transactions/toggle_favorite_coin_transaction.dart';
import 'package:crypto_management_task/domain/entities/coin.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'coin_state.dart';

@injectable
class CoinCubit extends Cubit<CoinState> {
  final GetAllCoinsTransaction _getAllCoinsTransaction;
  final ToggleFavoriteCoinTransaction _toggleFavoriteCoinTransaction;

  List<Coin> _coins = [];

  CoinCubit(this._getAllCoinsTransaction, this._toggleFavoriteCoinTransaction)
    : super(CoinInitial());

  Future<void> getCoins() async {
    emit(CoinsLoading());
    try {
      final coins = await _getAllCoinsTransaction(NoDto());
      _coins = coins;
      final favorites = _getFavoriteCoins();
      emit(CoinsLoaded(List.from(_coins), favorites));
    } catch (e) {
      emit(CoinsError(e.toString()));
    }
  }

  /// Toggles the favorite status of a coin optimistically and updates the UI.
  ///
  /// Immediately updates the local state and emits the new coins/favorites list,
  /// then attempts to persist the change via a transaction. If an error occurs,
  /// rolls back the change and emits an error state.
  Future<void> toggleFavorite(Coin coin) async {
    final index = _coins.indexWhere((c) => c.id == coin.id);
    if (index == -1) return;
    final oldCoin = _coins[index];

    final updatedCoin = coin.copyWith(isFavorite: !coin.isFavorite);
    _coins[index] = updatedCoin;
    final favorites = _getFavoriteCoins();
    emit(CoinsLoaded(List.from(_coins), favorites));

    try {
      final dto = ToggleFavoriteCoinDto(coin.id, coin.isFavorite);
      await _toggleFavoriteCoinTransaction(dto);
    } catch (e) {
      _coins[index] = oldCoin;
      final favorites = _getFavoriteCoins();
      emit(CoinsLoaded(List.from(_coins), favorites));
      emit(CoinsError(e.toString()));
    }
  }

  List<Coin> _getFavoriteCoins() {
    return _coins.where((coin) => coin.isFavorite).toList();
  }
}
