import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import '../../../../../../../../data/models/project_model.dart';
import '../../../../../../../../domain/entities/project_entity.dart';
import '../../../../infra/repositories/project_repository.dart';
import '../../project_details_page/state_page/modal_state_enum.dart';
import '../widgets/project_register_loading_modal.dart';
import '../widgets/project_register_modal.dart';
import '../widgets/project_register_success_modal.dart';
import 'subscrive_bottom_controller.dart';

class ProjectsController {
  final _repository = ProjectRepository();
  var modalStatusEnum = ValueNotifier<ModalStatusEnum>(ModalStatusEnum.initial);
  navigateToDetails(ProjectEntity proj) {
    Modular.to.pushNamed('projectdetails', arguments: proj);
  }

  Future<String> getAtavar(email) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    String avatarimage = profile['avatarCircle'];
    await profilesBox.close();
    return avatarimage;
  }

  Future<List<ProjectEntity>> getProjectListRepository(String link) async {
    return await _repository
        .getProjectList(link: link)
        .onError((error, stackTrace) => throw Error());
  }

  Future<void> intoRegister(ProjectEntity project, String email,
      SubscriveController subcontroller) async {
    modalStatusEnum.value = ModalStatusEnum.loading;
    await Future.delayed(const Duration(seconds: 2));
    modalStatusEnum.value = ModalStatusEnum.success;

    var hiveProjectssBox = await Hive.openBox("projects");
    project.students.add(email);

    hiveProjectssBox.put(
        project.projectId, ProjectModel.fromEntity(project).toJson());
    hiveProjectssBox.close();
    subcontroller.chageSubscrive(!subcontroller.isSubcribed.value);
  }

  Future<void> setInitialStatusModal(BuildContext context) async {
    Navigator.of(context).pop();
    await Future.delayed(const Duration(milliseconds: 100));
    modalStatusEnum.value = ModalStatusEnum.initial;
  }

  bool isSubscribed({required ProjectEntity project, required String email}) {
    return project.students.contains(email);
  }

  Future<void> registerProject(BuildContext context, ProjectEntity project,
      String email, SubscriveController subcontroller) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return ValueListenableBuilder(
            valueListenable: modalStatusEnum,
            builder: (_, ModalStatusEnum statusModal, __) {
              if (statusModal.isLoading) {
                return const ModalRegisterProjectLoading();
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
                project: project,
                email: email,
                subcontroller: subcontroller,
              );
            },
          );
        });
  }
}
