import 'package:crypto_management_task/application/dtos/toggle_favorite_coin_dto.dart';
import 'package:crypto_management_task/application/transactions/toggle_favorite_coin_transaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocs/moc_coin_repository.mocks.dart';

void main() {
  group('ToggleFavoriteCoinTransaction', () {
    late final MockCoinRepository mockRepository;
    late final ToggleFavoriteCoinTransaction usecase;

    setUp(() {
      mockRepository = MockCoinRepository();
      usecase = ToggleFavoriteCoinTransaction(coinRepository: mockRepository);
    });

    test(
      'should call toggleFavorite on CoinRepository with correct coinId',
      () async {
        // arrange
        final toggleFavoriteCoinDto = ToggleFavoriteCoinDto(1, true);

        when(
          mockRepository.toggleFavorite(
            toggleFaveCoinDto: toggleFavoriteCoinDto,
          ),
        ).thenAnswer((_) async {});

        // act
        await usecase(toggleFavoriteCoinDto);

        // assert
        verify(
          mockRepository.toggleFavorite(
            toggleFaveCoinDto: toggleFavoriteCoinDto,
          ),
        ).called(1);
      },
    );
  });
}
