part of 'coin_cubit.dart';

@immutable
sealed class CoinState {}

final class CoinInitial extends CoinState {}

final class CoinsLoading extends CoinState {}

final class CoinsLoaded extends CoinState {
  final List<Coin> coins;
  final List<Coin> favoriteCoins;
  CoinsLoaded(this.coins, this.favoriteCoins);
}

final class CoinsError extends CoinState {
  final String message;
  CoinsError(this.message);
}
