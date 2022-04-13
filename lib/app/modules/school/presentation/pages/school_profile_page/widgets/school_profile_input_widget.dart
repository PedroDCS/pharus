import 'package:flutter/material.dart';

class SchoolProfileInputWidget extends StatelessWidget {
  const SchoolProfileInputWidget({
    Key? key,
    required this.areaName,
    required this.textValue,
    this.readOnly = true,
  }) : super(key: key);
  final String areaName;
  final String textValue;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            areaName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(border: InputBorder.none),
            readOnly: readOnly,
            initialValue: textValue,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
