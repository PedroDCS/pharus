import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../../data/models/school_model.dart';
import '../../../../../domain/entities/school_entity.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import '../../widgets/school_app_bar.dart';
import 'widgets/school_profile_input_widget.dart';

class SchoolProfilePage extends StatelessWidget {
  const SchoolProfilePage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  Future<SchoolEntity> getProfifeData(String email) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    await profilesBox.close();
    return SchoolModel.fromJson(Map<String, dynamic>.from(profile));
  }

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
        child: FutureBuilder<SchoolEntity>(
          future: getProfifeData(email),
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
                          image: const DecorationImage(
                            image: AssetImage('assets/icons/school.png'),
                          ),
                        ),
                      ),
                    ),
                    SchoolProfileInputWidget(
                      areaName: 'Nome',
                      textValue: snapshot.data!.name,
                    ),
                    SchoolProfileInputWidget(
                      areaName: 'Responsavel',
                      textValue: snapshot.data!.administeredby,
                    ),
                    SchoolProfileInputWidget(
                      areaName: 'Cargo',
                      textValue: snapshot.data!.position,
                    ),
                    SchoolProfileInputWidget(
                      areaName: 'E-mail',
                      textValue: snapshot.data!.email,
                    ),
                    SchoolProfileInputWidget(
                      areaName: 'Cidade',
                      textValue: snapshot.data!.city,
                    )
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
