import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/student/submodules/projects/presentation/pages/projects_page/widgets/project_register_modal.dart';
import 'package:pharus/app/modules/student/submodules/projects/presentation/pages/projects_page/widgets/project_register_success_modal.dart';
import '../../../../../../../../shared/app_colors/app_colors.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../infra/repositories/project_repository.dart';
import '../../project_details_page/state_page/modal_state_enum.dart';
import '../widgets/project_register_button.dart';
import '../widgets/project_register_loading_modal.dart';

class ProjectsController {
  final _repository = ProjectRepository();
  var modalStatusEnum = ValueNotifier<ModalStatusEnum>(ModalStatusEnum.initial);

  navigateToDetails(ProjectEntity proj) {
    Modular.to.pushNamed('projectdetails', arguments: proj);
  }

  Future<List<ProjectEntity>> getProjectListRepository(String link) async {
    return await _repository
        .getProjectList(link: link)
        .onError((error, stackTrace) => throw Error());
  }

  Future<void> intoRegister() async {
    modalStatusEnum.value = ModalStatusEnum.loading;
    await Future.delayed(const Duration(seconds: 2));
    modalStatusEnum.value = ModalStatusEnum.success;
  }

  Future<void> setInitialStatusModal(BuildContext context) async {
    Navigator.of(context).pop();
    await Future.delayed(const Duration(milliseconds: 100));
    modalStatusEnum.value = ModalStatusEnum.initial;
  }

  Future<void> registerProject(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return ValueListenableBuilder(
            valueListenable: modalStatusEnum,
            builder: (_, ModalStatusEnum statusModal, __) {
              if (statusModal.isLoading) {
                return ModalRegisterProjectLoading();
              }
              if (statusModal.isSuccess) {
                return ModalRegisterSuccessProject(
                  onClose: () {
                    setInitialStatusModal(ctx);
                  },
                );
              }
              return ModalRegisterProject(
                confirmRegistration: intoRegister,
              );
            },
          );
        });
  }
}
