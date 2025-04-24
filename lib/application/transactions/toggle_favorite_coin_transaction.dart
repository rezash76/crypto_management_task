import 'package:crypto_management_task/application/transactions/transaction.dart';
import 'package:crypto_management_task/domain/repositories/coin_ropository.dart';
import 'package:crypto_management_task/application/dtos/toggle_favorite_coin_dto.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToggleFavoriteCoinTransaction
    implements Transaction<void, ToggleFavoriteCoinDto> {
  final CoinRepository coinRepository;

  ToggleFavoriteCoinTransaction({required this.coinRepository});

  @override
  Future<void> call(ToggleFavoriteCoinDto request) async =>
      await coinRepository.toggleFavorite(coinId: request);
}
