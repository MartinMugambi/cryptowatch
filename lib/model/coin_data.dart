class CoinData {
  final String name;
  final String symbol;
  final String imageUrl;
  final double current_price;
  final double price_change_24h;
  final double price_change_percentage_24h;
  CoinData({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.current_price,
    required this.price_change_24h,
    required this.price_change_percentage_24h,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) {
    return CoinData(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      current_price: json['current_price'].toDouble(),
      price_change_24h: json['price_change_24h'],
      price_change_percentage_24h: json['price_change_percentage_24h'],
    );
  }
}
