import 'package:flutter/material.dart';

class CompanyHomeButtomWidget extends StatelessWidget {
  const CompanyHomeButtomWidget({
    Key? key,
    required this.iconButtom,
    required this.textButtom,
    required this.function,
  }) : super(key: key);
  final String iconButtom;
  final String textButtom;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.square(130),
          primary: const Color(0xFFC3C3C3),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Column(
          children: [
            ImageIcon(
              AssetImage(iconButtom),
              size: 48,
              color: Colors.black,
            ),
            Text(
              textButtom,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )
          ],
        ));
  }
}
