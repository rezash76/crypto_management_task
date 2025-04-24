import 'package:crypto_management_task/presentation/blocs/app_them/app_theme_cubit.dart';
import 'package:crypto_management_task/presentation/blocs/coin/coin_cubit.dart';
import 'package:crypto_management_task/presentation/pages/prifile_page.dart';
import 'package:crypto_management_task/presentation/widgets/coin_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<CoinCubit>().getCoins();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aban Tether'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              context.read<AppThemeCubit>().toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'All Coins'), Tab(text: 'Favorites')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocBuilder<CoinCubit, CoinState>(
            builder: (context, state) {
              if (state is CoinsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CoinsLoaded) {
                return _buildCoinsList(context, state.coins);
              }
              if (state is CoinsError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return SizedBox.shrink();
            },
          ),
          BlocBuilder<CoinCubit, CoinState>(
            builder: (context, state) {
              if (state is CoinsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CoinsLoaded) {
                return _buildCoinsList(context, state.favoriteCoins);
              }
              if (state is CoinsError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCoinsList(BuildContext context, List<dynamic> coins) {
    if (coins.isEmpty) {
      return const Center(child: Text('No coins available'));
    }
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return CoinListItem(
          key: ValueKey(coin.id),
          coin: coin,
          onFavoriteToggle: () {
            context.read<CoinCubit>().toggleFavorite(coin);
          },
        );
      },
    );
  }
}
