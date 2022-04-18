import 'package:flutter/material.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import '../../widgets/company_app_bar.dart';
import 'widgets/company_profile_input_widget.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor800,
      appBar: const PreferredSize(
        child: CompanyAppBarWidget(
          title: 'Perfil',
          imageAsset: 'assets/icons/exit.png',
          barColor: Colors.transparent,
          textColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(53, 48, 53, 48),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/company.png'),
                  ),
                ),
              ),
            ),
            const CompanyProfileInputWidget(
              areaName: 'Nome',
              textValue: 'Empresa',
            ),
            const CompanyProfileInputWidget(
              areaName: 'Responsavel',
              textValue: 'Guilherme Almeida Neto',
            ),
            const CompanyProfileInputWidget(
              areaName: 'Cargo',
              textValue: 'CEO',
            ),
            const CompanyProfileInputWidget(
              areaName: 'E-mail',
              textValue: 'guilherme.neto@empresa.com.br',
            ),
            const CompanyProfileInputWidget(
              areaName: 'Cidade',
              textValue: 'Belo Horizonte, MG',
            )
          ],
        ),
      ),
    );
  }
}
