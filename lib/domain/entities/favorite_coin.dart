import 'package:crypto_management_task/domain/entities/entity.dart';

base class FavoriteCoin extends Entity {
  final int userId;
  final int cryptocurrencyId;

  FavoriteCoin({
    required super.id,
    required super.createdAt,
    required this.userId,
    required this.cryptocurrencyId,
  });
}
