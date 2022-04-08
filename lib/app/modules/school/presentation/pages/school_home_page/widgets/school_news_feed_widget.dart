import 'package:flutter/material.dart';

class SchoolNewsFeedWidget extends StatelessWidget {
  const SchoolNewsFeedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFC8C8C8),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 27, 10, 20),
      child: Column(children: const [
        Text(
          "Feed de notícias",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 36),
          child: Text(
            "A empresa XPTO, em parceria com a escola, lançou o projeto Voluntários Digitais. Dá uma olhadinha lá, quem sabe você se identifica com a proposta!",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        )
      ]),
    );
  }
}
