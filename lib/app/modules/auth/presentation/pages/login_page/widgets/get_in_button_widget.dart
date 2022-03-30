import 'package:flutter/material.dart';

class GetInButtonWidget extends StatelessWidget {
  final Function login;
  const GetInButtonWidget({
    Key? key,
    required this.login,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        login();
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(60),
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 28.5, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: const Text(
        "Entrar",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }
}
