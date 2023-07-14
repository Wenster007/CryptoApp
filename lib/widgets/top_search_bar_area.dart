import 'package:flutter/material.dart';
import 'package:cryptoapp/widgets/search_bar.dart' as sb;


class TopSearchBarArea extends StatelessWidget {
  const TopSearchBarArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          sb.SearchBar(),
          const SizedBox(
            width: 12,
          ),
          const Icon(
            Icons.more_horiz,
            size: 40,
            color: Color(0xFF737a8a),
          ),
        ],
      ),
    );
  }
}
