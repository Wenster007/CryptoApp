import 'package:flutter/material.dart';

class HeadingsRow extends StatelessWidget {
  const HeadingsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle( padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.zero),),
            child: const Text(
              "Name↕/Vol↕",
              style: TextStyle(
                  color: Color(0xFF3c424e),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle( padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero),),
                child: const Text(
                  "Last Price↕",
                  style: TextStyle(
                      color: Color(0xFF3c424e),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width:
                MediaQuery.of(context).size.width * 0.09,
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle( padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero),),
                child: const Text(
                  "24h Chg%↕",
                  style: TextStyle(
                      color: Color(0xFF3c424e),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
