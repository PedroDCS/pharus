import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/app_colors/app_colors.dart';
import '../../../../../shared/modal/log_out_modal.dart';
import '../../../domain/entities/student_entity.dart';
import '../../widgets/student_app_bar.dart';
import '../home_page/controllers/student_home_controller.dart';
import 'widgets/student_profile_input_widget.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState
    extends ModularState<StudentProfile, StudentHomeController> {
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
        appBar: PreferredSize(
          child: StudentAppBarWidget(
            title: 'Perfil',
            imageAsset: 'assets/icons/exit.png',
            barColor: Colors.transparent,
            buttomGoBack: false,
            textColor: Colors.white,
            ontap: () {
              logOutModal(context);
            },
          ),
          preferredSize: const Size.fromHeight(60),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(53, 48, 53, 48),
            child: FutureBuilder<StudentEntity>(
              future: controller.getProfifeData(widget.email),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    );
                  case ConnectionState.none:
                    return const LinearProgressIndicator(
                      value: 1,
                      color: Colors.red,
                    );
                  default:
                    return Column(
                      children: [
                        Center(
                          child: Container(
                            height: 120,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage(snapshot.data!.avatarCircle),
                              ),
                            ),
                          ),
                        ),
                        StudentProfileInputWidget(
                          areaName: 'Nome',
                          textValue: snapshot.data!.name,
                        ),
                        StudentProfileInputWidget(
                          areaName: 'E-mail',
                          textValue: snapshot.data!.email,
                        ),
                        StudentProfileInputWidget(
                          areaName: 'Escola',
                          textValue: snapshot.data!.schoolName,
                        ),
                        StudentProfileInputWidget(
                          areaName: 'Período escolar',
                          textValue: snapshot.data!.schoolYear,
                        ),
                        StudentProfileInputWidget(
                          areaName: 'Cidade',
                          textValue: snapshot.data!.city,
                        )
                      ],
                    );
                }
              },
            )),
      ),
    );
  }
}
