import 'package:flutter/material.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import 'widgets/school_profile_input_widget.dart';
import '../../widgets/school_app_bar.dart';

class SchoolProfilePage extends StatelessWidget {
  const SchoolProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor30,
      appBar: const PreferredSize(
        child: SchoolAppBarWidget(
          title: 'Perfil',
          imageAsset: 'assets/icons/exit.png',
          barColor: Colors.transparent,
          textColor: Colors.black,
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
                    image: AssetImage('assets/icons/school.png'),
                  ),
                ),
              ),
            ),
            const SchoolProfileInputWidget(
              areaName: 'Nome',
              textValue: 'Escola estadual João da Silva',
            ),
            const SchoolProfileInputWidget(
              areaName: 'Responsavel',
              textValue: 'Maria Helena Vilela',
            ),
            const SchoolProfileInputWidget(
              areaName: 'Cargo',
              textValue: 'Diretora',
            ),
            const SchoolProfileInputWidget(
              areaName: 'E-mail',
              textValue: 'maria.helena.diretora@gmail.com',
            ),
            const SchoolProfileInputWidget(
              areaName: 'Cidade',
              textValue: 'Lavras, MG',
            )
          ],
        ),
      ),
    );
  }
}
