import 'dart:async';
import 'dart:convert';

import 'package:cryptoapp/model/Coin.dart';
import 'package:cryptoapp/widgets/coin_item_tile.dart';
import 'package:cryptoapp/widgets/headings_row.dart';
import 'package:cryptoapp/widgets/top_search_bar_area.dart';
import 'package:cryptoapp/widgets/vsCurrency_row.dart';
import 'package:cryptoapp/data/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _vsCurrencies = ["USDT", "BUSD", "BNB", "BTC", "ALTS"];
  int _selectedVSCurrencyIndex = 0;

  Stream<List<Coin>> getPostApi() async* {
    while(true) {
      coins.clear();
      print("I am running");
      final response = await http.get(
        Uri.parse(
            "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"),
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (Map i in data) {
          coins.add(Coin.fromJson(i));
        }
        yield coins;
      } else {
        yield coins;
      }

      await Future.delayed(const Duration(seconds: 20));
    }

  }

  Widget _buildVSCurrencyIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedVSCurrencyIndex = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.035,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          color: _selectedVSCurrencyIndex == index
              ? const Color(0xFF434c5b)
              : const Color(0xFF1f2630),
          borderRadius: const BorderRadius.all(Radius.circular(3)),
        ),
        alignment: Alignment.center,
        child: Text(
          _vsCurrencies[index],
          style: TextStyle(
            color: _selectedVSCurrencyIndex == index
                ? const Color(0xFF8a919a)
                : const Color(0xFF808692),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF171e26),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            children: [
              const TopSearchBarArea(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1f2630),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      VSCurrencyRow(
                          vsCurrencies: _vsCurrencies,
                          buildVSCurrencyIcons: _buildVSCurrencyIcons),
                      const HeadingsRow(),
                      Expanded(
                        child: StreamBuilder(
                          stream: getPostApi(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Error"),
                              );
                            }

                            return ListView.builder(
                              itemCount: coins.length,
                              itemBuilder: (context, index) =>
                                  CoinItemTile(coin: coins[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
