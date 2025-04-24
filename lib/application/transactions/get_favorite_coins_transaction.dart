import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/application/transactions/transaction.dart';
import 'package:crypto_management_task/domain/entities/favorite_coin.dart';
import 'package:crypto_management_task/domain/repositories/coin_ropository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFavoriteCoinsTransaction implements Transaction<void, NoDto> {
  final CoinRepository coinRepository;

  GetFavoriteCoinsTransaction({required this.coinRepository});

  @override
  Future<List<FavoriteCoin>> call(NoDto request) async =>
      await coinRepository.getAllFavouriteCoins();
}
