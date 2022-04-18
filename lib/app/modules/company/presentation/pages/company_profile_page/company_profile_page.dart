import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../../data/models/company_model.dart';
import '../../../../../domain/entities/company_entity.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import '../../widgets/company_app_bar.dart';
import 'widgets/company_profile_input_widget.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  Future<CompanyEntity> getProfifeData(String email) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    await profilesBox.close();
    return CompanyModel.fromJson(Map<String, dynamic>.from(profile));
  }

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
          child: FutureBuilder<CompanyEntity>(
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
                              image: AssetImage('assets/icons/company.png'),
                            ),
                          ),
                        ),
                      ),
                      CompanyProfileInputWidget(
                        areaName: 'Nome',
                        textValue: snapshot.data!.name,
                      ),
                      CompanyProfileInputWidget(
                        areaName: 'Responsavel',
                        textValue: snapshot.data!.administeredby,
                      ),
                      CompanyProfileInputWidget(
                        areaName: 'Cargo',
                        textValue: snapshot.data!.position,
                      ),
                      CompanyProfileInputWidget(
                        areaName: 'E-mail',
                        textValue: snapshot.data!.email,
                      ),
                      CompanyProfileInputWidget(
                        areaName: 'Cidade',
                        textValue: snapshot.data!.city,
                      )
                    ],
                  );
              }
            },
          )),
    );
  }
}
