import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';

class CompanyProjectGameRulesWidget extends StatelessWidget {
  const CompanyProjectGameRulesWidget({
    Key? key,
    required this.rules,
  }) : super(key: key);
  final String rules;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 32, 25, 24),
      decoration: BoxDecoration(
        color: AppColors.primaryColor30,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Regras do projeto',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, bottom: 24),
            child: Text(
              rules,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                primary: AppColors.secondaryColor600,
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
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
