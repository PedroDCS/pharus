import 'package:flutter/material.dart';

class CompanyProfileInputWidget extends StatelessWidget {
  const CompanyProfileInputWidget({
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
              color: Colors.white,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(border: InputBorder.none),
            readOnly: readOnly,
            initialValue: textValue,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
