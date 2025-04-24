import 'package:crypto_management_task/domain/entities/coin.dart';
import 'package:flutter/material.dart';

class CoinListItem extends StatelessWidget {
  final Coin coin;
  final VoidCallback onFavoriteToggle;

  const CoinListItem({
    super.key,
    required this.coin,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Text(
          coin.symbol.isNotEmpty ? coin.symbol[0] : '?',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      title: Text(
        coin.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(coin.symbol),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            coin.price.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          IconButton(
            icon: Icon(
              coin.isFavorite ? Icons.star : Icons.star_border,
              color: coin.isFavorite ? Colors.amber : Colors.grey,
            ),
            onPressed: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}
