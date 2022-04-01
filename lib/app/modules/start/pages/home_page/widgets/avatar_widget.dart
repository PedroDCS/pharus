import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            "Olá Antonia!",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 24.41),
            child: Image.asset(
              'assets/images/girl happy drinking coffe flat illustration 2.png',
              width: 118,
              height: 317.59,
            ),
          ),
        ],
      ),
    );
  }
}
