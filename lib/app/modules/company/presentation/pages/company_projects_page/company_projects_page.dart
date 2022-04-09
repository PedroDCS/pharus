import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../widgets/company_app_bar.dart';
import 'controller/company_projects_controller.dart';
import 'widgets/company_project_list_widget.dart';

class CompanyProjectsPage extends StatefulWidget {
  const CompanyProjectsPage({Key? key}) : super(key: key);

  @override
  State<CompanyProjectsPage> createState() => _CompanyProjectsPageState();
}

class _CompanyProjectsPageState
    extends ModularState<CompanyProjectsPage, CompanyProjectsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        child: CompanyAppBarWidget(
          title: 'Seus Projetos',
          imageAsset: 'assets/icons/company.png',
          barColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            CompanyProjectListWidget(
              future: controller.getProjectListRepository("link"),
              navigateTo: controller.navigateToDetails,
            )
          ],
        ),
      ),
    );
  }
}
