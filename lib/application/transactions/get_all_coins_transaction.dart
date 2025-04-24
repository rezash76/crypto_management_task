import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/application/transactions/transaction.dart';
import 'package:crypto_management_task/domain/entities/coin.dart';
import 'package:crypto_management_task/domain/repositories/coin_ropository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllCoinsTransaction implements Transaction<void, NoDto> {
  final CoinRepository coinRepository;

  GetAllCoinsTransaction({required this.coinRepository});

  @override
  Future<List<Coin>> call(NoDto request) async =>
      await coinRepository.getAllCoins();
}
