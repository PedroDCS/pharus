import 'package:flutter/material.dart';

class RankingProjectItemMedalWidget extends StatelessWidget {
  const RankingProjectItemMedalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          "assets/icons/3place.png",
          height: 133,
          width: 163,
        ),
        Image.asset(
          "assets/icons/Medalha.png",
          height: 104,
          width: 104,
        )
      ]),
    );
  }
}
