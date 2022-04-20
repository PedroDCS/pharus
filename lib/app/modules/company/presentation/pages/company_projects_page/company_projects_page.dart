import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import '../../widgets/company_app_bar.dart';
import 'controller/company_projects_controller.dart';
import 'widgets/company_project_list_widget.dart';

class CompanyProjectsPage extends StatefulWidget {
  const CompanyProjectsPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<CompanyProjectsPage> createState() => _CompanyProjectsPageState();
}

class _CompanyProjectsPageState
    extends ModularState<CompanyProjectsPage, CompanyProjectsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor800,
      appBar: const PreferredSize(
        child: CompanyAppBarWidget(
          title: 'Seus Projetos',
          imageAsset: 'assets/icons/company.png',
          barColor: Colors.transparent,
          textColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            CompanyProjectListWidget(
              future:
                  controller.getProjectListRepository("projects", widget.email),
              navigateTo: controller.navigateToDetails,
            )
          ],
        ),
      ),
    );
  }
}
