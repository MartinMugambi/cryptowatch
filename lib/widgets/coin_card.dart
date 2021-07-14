//Package
import 'package:crypto_base/constants/constants.dart';
import "package:flutter/material.dart";

class CoinCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String name;
  final String symbol;
  final String image;
  final double current_price;
  final double price_change_percebtage_24h;
  CoinCard(
      {@required this.width,
      this.height,
      required this.name,
      required this.image,
      required this.symbol,
      required this.current_price,
      required this.price_change_percebtage_24h});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[900],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(image),
              ),
              height: 60.0,
              width: 60.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: coinName,
                    ),
                    Text(
                      symbol,
                      style: coinSymbol,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${current_price.toString()}",
                    style: coinPrice,
                  ),
                  Text(
                    price_change_percebtage_24h.toString(),
                    style: coinChange,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
