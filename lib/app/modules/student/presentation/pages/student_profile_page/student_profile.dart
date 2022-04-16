import 'package:flutter/material.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import '../../widgets/student_app_bar.dart';
import 'widgets/student_profile_input_widget.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              AppColors.secondaryColor600,
              AppColors.tertiaryColor100,
              AppColors.primaryColor80,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
          child: StudentAppBarWidget(
            title: 'Perfil',
            imageAsset: 'assets/icons/exit.png',
            barColor: Colors.transparent,
            buttomGoBack: false,
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
                      image: AssetImage('assets/images/perfil_default.png'),
                    ),
                  ),
                ),
              ),
              const StudentProfileInputWidget(
                areaName: 'Nome',
                textValue: 'Antonia Ferreira',
              ),
              const StudentProfileInputWidget(
                areaName: 'E-mail',
                textValue: 'antonia.ferreira@gmail.com',
              ),
              const StudentProfileInputWidget(
                areaName: 'Escola',
                textValue: 'Escola Estadual João da Silva',
              ),
              const StudentProfileInputWidget(
                areaName: 'Período escolar',
                textValue: '7º ano',
              ),
              const StudentProfileInputWidget(
                areaName: 'Cidade',
                textValue: 'Lavras, MG',
              )
            ],
          ),
        ),
      ),
    );
  }
}
