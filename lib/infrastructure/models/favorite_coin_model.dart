class FavoriteCoinModel {
  final int id;
  final int createdAt;
  final int userId;
  final int cryptocurrencyId;

  FavoriteCoinModel({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.cryptocurrencyId,
  });

  factory FavoriteCoinModel.fromJson(Map<String, dynamic> json) {
    return FavoriteCoinModel(
      id: json['id'],
      createdAt: json['created_at'],
      userId: json['user_id'],
      cryptocurrencyId: json['cryptocurrency_id'],
    );
  }
}
