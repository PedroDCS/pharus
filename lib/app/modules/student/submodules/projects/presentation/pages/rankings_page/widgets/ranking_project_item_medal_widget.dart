import 'package:flutter/material.dart';

class RankingProjectItemMedalWidget extends StatelessWidget {
  const RankingProjectItemMedalWidget({
    Key? key,
    required this.place,
    required this.medal,
  }) : super(key: key);
  final String place;
  final String medal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          place,
          height: 133,
          width: 163,
        ),
        Image.asset(
          medal,
          height: 104,
          width: 104,
        )
      ]),
    );
  }
}
