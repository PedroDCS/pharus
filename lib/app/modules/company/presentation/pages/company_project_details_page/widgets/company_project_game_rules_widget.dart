import 'package:flutter/material.dart';

class CompanyProjectGameRulesWidget extends StatelessWidget {
  const CompanyProjectGameRulesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 32, 25, 24),
      decoration: BoxDecoration(
        color: const Color(0xFFE1E1E1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Regras do projeto',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 24),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget nulla lorem. Aenean nec urna bibendum, auctor orci in, euismod metus. Donec elementum purus hendrerit ante consequat, vitae hendrerit neque tempus. Duis porta hendrerit ligula, eget pharetra magna rutrum sed. Vestibulum dignissim odio lectus, vitae vehicula odio dapibus ut. Integer id ex id ante volutpat cursus. Fusce urna dolor, varius euismod mi et, mollis elementum est. Nunc tincidunt mauris vitae turpis imperdiet, vel vestibulum lorem hendrerit. Vivamus quis urna pharetra, convallis lectus vel, volutpat felis. Donec dapibus pretium erat, in porttitor neque pharetra id. Quisque cursus tincidunt lectus sed blandit. Fusce ac ante eget ante malesuada mollis vitae a nisl.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFC3C3C3),
                padding:
                    const EdgeInsets.symmetric(horizontal: 27.5, vertical: 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: const Text(
                "Fechar",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
