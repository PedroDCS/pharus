import 'package:flutter/material.dart';

class LoginHeadWidget extends StatelessWidget {
  const LoginHeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 82.33),
            alignment: Alignment.center,
            child: Image.asset('assets/images/pharos_icon.png',
                height: 51.33, width: 36.56)),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Login',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
