import 'package:flutter/material.dart';

class LoginInputAreaWidget extends StatelessWidget {
  final String areaName;
  final bool obscureText;
  final TextEditingController control;

  const LoginInputAreaWidget({
    Key? key,
    required this.areaName,
    this.obscureText = false,
    required this.control,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          areaName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          controller: control,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: areaName,
          ),
        ),
      ],
    );
  }
}
