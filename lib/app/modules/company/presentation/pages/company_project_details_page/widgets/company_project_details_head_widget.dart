import 'package:flutter/material.dart';

class CompanyProjectDetailsHeadWidget extends StatelessWidget {
  const CompanyProjectDetailsHeadWidget({
    Key? key,
    required this.mentor,
    required this.description,
  }) : super(key: key);
  final String mentor;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mentor,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 16),
          child: Text(
            "Descrição:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
