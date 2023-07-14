import 'package:flutter/material.dart';

class VSCurrencyRow extends StatelessWidget {
  const VSCurrencyRow({Key? key, required this.vsCurrencies, required this.buildVSCurrencyIcons}) : super(key: key);

  final List<String> vsCurrencies;
  final Widget Function(int index) buildVSCurrencyIcons;

  @override
  Widget build(BuildContext context) {
    final List<String> vsCurrencies = ["USDT", "BUSD", "BNB", "BTC", "ALTS"];

    return Padding(
      padding: const EdgeInsets.only(
         top: 15, bottom: 0, left: 10, right: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: vsCurrencies
              .asMap()
              .entries
              .map((e) => buildVSCurrencyIcons(e.key))
              .toList()),
    );
  }
}
