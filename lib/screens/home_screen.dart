//Packages
import 'dart:convert';

import 'package:crypto_base/model/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Constants
import '../constants/constants.dart';

//Serivices

//Widgets
import "../widgets/coin_card.dart";

class HomeScreen extends StatefulWidget {
  static final String id = "home_screen";
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  double? _deviceHeight;
  double? _deviceWidth;
  late Future<List<CoinData>> futureCoinData;

  Future<List<CoinData>> fetchCoinData() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse.map((data) => new CoinData.fromJson(data)).toList();
    } else {
      throw Exception('Could not load coin List');
    }
  }

  @override
  void initState() {
    super.initState();
    futureCoinData = fetchCoinData();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'CRYPTOBASE',
            style: appBar,
          ),
        ),
      ),
      body: FutureBuilder<List<CoinData>>(
        future: futureCoinData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CoinData>? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return CoinCard(
                  width: _deviceWidth! / 2,
                  height: _deviceHeight! / 8,
                  image: data[index].imageUrl,
                  name: data[index].name,
                  symbol: data[index].symbol,
                  current_price: data[index].current_price.toDouble(),
                  price_change_percebtage_24h:
                      data[index].price_change_percentage_24h,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
