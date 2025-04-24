import 'package:crypto_management_task/application/dtos/dto.dart';

base class ToggleFavoriteCoinDto extends Dto {
  final int id;
  final bool isFavorite;

  ToggleFavoriteCoinDto(this.id, this.isFavorite);

  @override
  Map<String, dynamic> toJson() => {'cryptocurrency_id': id};
}
