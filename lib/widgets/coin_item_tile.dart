import 'package:cryptoapp/model/Coin.dart';
import 'package:flutter/material.dart';

class CoinItemTile extends StatelessWidget {
  const CoinItemTile({Key? key, required this.coin}) : super(key: key);

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    String formatNumber(num value) {
      String formattedValue = value.toStringAsFixed(4);
      List<String> parts = formattedValue.split('.');

      // Format the integer part with comma-separated thousands
      String integerPart = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},',
      );

      // Truncate the decimal part to two decimal places
      String decimalPart = parts[1].substring(0, 2);

      // Combine the formatted integer part with the decimal part
      String formattedNumber = '$integerPart.$decimalPart';

      return formattedNumber;
    }

    String convertToMillionsOrBillions(num value) {
      if (value >= 1000000000) {
        double result = value / 1000000000;
        return '${result.toStringAsFixed(2)}B';
      } else if (value >= 1000000) {
        double result = value / 1000000;
        return '${result.toStringAsFixed(2)}M';
      } else {
        return value.toString();
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.09,
        // color: Colors.black87,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          coin.symbol!.toUpperCase(),
                          style: const TextStyle(
                              color: Color(0xFFe9edf5),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " /USDT",
                          style:
                              TextStyle(color: Color(0xFF7f8591), fontSize: 15),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          height: 18,
                          width: 25,
                          decoration: const BoxDecoration(
                            color: Color(0xFF2a313b),
                          ),
                          child: const Text(
                            "10x",
                            style: TextStyle(
                                color: Color(0xFFcfbf5d),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Vol ${convertToMillionsOrBillions(coin.totalVolume!)}",
                      style: const TextStyle(
                        color: Color(0xFF666d77),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          formatNumber(coin.currentPrice!),
                          style: const TextStyle(
                              color: Color(0xFF43b590),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "\$${formatNumber(coin.currentPrice!)}",
                          style: const TextStyle(
                              color: Color(0xFF717882),
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: coin.priceChangePercentage24h! > 0
                              ? Color(0xFF2ebd83)
                              : (coin.priceChangePercentage24h == 0
                                  ? Colors.grey
                                  : Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      alignment: Alignment.center,
                      child: Text(
                        "${coin.priceChangePercentage24h!.toStringAsFixed(2)}%",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
