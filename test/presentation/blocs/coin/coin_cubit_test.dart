import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_management_task/presentation/blocs/coin/coin_cubit.dart';
import 'package:crypto_management_task/domain/entities/coin.dart';
import 'package:mockito/mockito.dart';

import '../../mocs/coin_cubit_test_mocs.mocks.dart';

void main() {
  late MockGetAllCoinsTransaction mockGetAllCoinsTransaction;
  late MockToggleFavoriteCoinTransaction mockToggleFavoriteCoinTransaction;
  late CoinCubit cubit;

  final testCoins = [
    Coin(
      id: 1,
      name: 'BTC',
      isFavorite: false,
      price: 0,
      symbol: '',
      iconAddress: '',
      createdAt: 0,
    ),
    Coin(
      id: 2,
      name: 'ETH',
      isFavorite: true,
      price: 0,
      symbol: '',
      iconAddress: '',
      createdAt: 0,
    ),
  ];

  setUp(() {
    mockGetAllCoinsTransaction = MockGetAllCoinsTransaction();
    mockToggleFavoriteCoinTransaction = MockToggleFavoriteCoinTransaction();
    cubit = CoinCubit(
      mockGetAllCoinsTransaction,
      mockToggleFavoriteCoinTransaction,
    );
  });

  group('CoinCubit', () {
    blocTest<CoinCubit, CoinState>(
      'emits [CoinsLoading, CoinsLoaded] when getCoins succeeds',
      build: () {
        when(
          mockGetAllCoinsTransaction(any),
        ).thenAnswer((_) async => testCoins);
        return cubit;
      },
      act: (cubit) => cubit.getCoins(),
      expect:
          () => [
            isA<CoinsLoading>(),
            isA<CoinsLoaded>().having(
              (state) => state.coins,
              'coins',
              testCoins,
            ),
          ],
      verify: (_) {
        verify(mockGetAllCoinsTransaction(any)).called(1);
      },
    );

    blocTest<CoinCubit, CoinState>(
      'emits [CoinsLoading, CoinsError] when getCoins throws',
      build: () {
        when(mockGetAllCoinsTransaction(any)).thenThrow(Exception);
        return cubit;
      },
      act: (cubit) => cubit.getCoins(),
      expect: () => [isA<CoinsLoading>(), isA<CoinsError>()],
      verify: (_) {
        verify(mockGetAllCoinsTransaction(any)).called(1);
      },
    );

    blocTest<CoinCubit, CoinState>(
      'emits [CoinsLoaded] with updated favorite when toggleFavorite succeeds',
      build: () {
        when(
          mockGetAllCoinsTransaction(any),
        ).thenAnswer((_) async => testCoins);
        when(mockToggleFavoriteCoinTransaction(any)).thenAnswer((_) async {});
        cubit = CoinCubit(
          mockGetAllCoinsTransaction,
          mockToggleFavoriteCoinTransaction,
        );
        return cubit;
      },
      act: (cubit) async {
        await cubit.getCoins(); // initializing state and _coin
        await cubit.toggleFavorite(testCoins[0]);
      },
      expect:
          () => [
            isA<CoinsLoading>(),
            isA<CoinsLoaded>(), // after getCoins()
            isA<CoinsLoaded>(), // for toggle
          ],
      verify: (_) {
        verify(mockToggleFavoriteCoinTransaction(any)).called(1);
      },
    );

    blocTest<CoinCubit, CoinState>(
      'emits [CoinsLoaded, CoinsLoaded, CoinsError] when toggleFavorite throws',
      build: () {
        when(
          mockGetAllCoinsTransaction(any),
        ).thenAnswer((_) async => testCoins);
        when(mockToggleFavoriteCoinTransaction(any)).thenThrow(Exception);
        return CoinCubit(
          mockGetAllCoinsTransaction,
          mockToggleFavoriteCoinTransaction,
        );
      },
      act: (cubit) async {
        await cubit.getCoins(); // initializing state and _coin
        await cubit.toggleFavorite(testCoins[0]);
      },
      expect:
          () => [
            isA<CoinsLoading>(), // from getCoins
            isA<CoinsLoaded>(), // from getCoins
            isA<CoinsLoaded>(), // optimistic update (toggleFavorite)
            isA<
              CoinsLoaded
            >(), // rollback to previous coins (toggleFavorite fail)
            isA<CoinsError>(), // error emitted
          ],
      verify: (_) {
        verify(mockToggleFavoriteCoinTransaction(any)).called(1);
      },
    );

    blocTest<CoinCubit, CoinState>(
      'does nothing when toggleFavorite is called for a non-existent coin',
      build: () {
        return cubit;
      },
      act:
          (cubit) => cubit.toggleFavorite(
            Coin(
              id: 999,
              name: 'NotExist',
              isFavorite: false,
              price: 0,
              symbol: '',
              iconAddress: '',
              createdAt: 0,
            ),
          ),
      expect: () => [],
      verify: (_) {
        verifyNever(mockToggleFavoriteCoinTransaction(any));
      },
    );
  });
}
