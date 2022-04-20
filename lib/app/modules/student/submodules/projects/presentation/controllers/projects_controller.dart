import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../widgets/custom_modal_loading_widget.dart';
import '../../../../widgets/custom_modal_success_widget.dart';
import '../../data/models/project_model.dart';
import '../../data/repositories/project_repository.dart';
import '../../domain/entities/project_entity.dart';
import '../pages/project_details_page/state_page/modal_state_enum.dart';
import '../pages/project_details_page/widgets/project_game_rules_widget.dart';
import '../pages/projects_page/widgets/project_register_modal.dart';
import '../pages/projects_page/controller/subscrive_bottom_controller.dart';

class ProjectsController {
  final _repository = ProjectRepository();
  var modalStatusEnum = ValueNotifier<ModalStatusEnum>(ModalStatusEnum.initial);
  final FirebaseStorage storage = FirebaseStorage.instance;

  XFile? image;
  var isData = ValueNotifier<bool>(false);
  var nameImage = ValueNotifier<String>('');
  String path = '';

  navigateToDetails(ProjectEntity proj, String email) {
    Modular.to.pushNamed('projectdetails', arguments: [proj, email]);
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

    var hiveProjectssBox = await Hive.openBox("projects");
    project.students.add(email);

    hiveProjectssBox.put(
        project.projectId, ProjectModel.fromEntity(project).toJson());
    hiveProjectssBox.close();
    subcontroller.chageSubscrive(!subcontroller.isSubcribed.value);
    modalStatusEnum.value = ModalStatusEnum.success;
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
              return const ModalLoadingWidget();
            }
            if (statusModal.isSuccess) {
              return ModalSuccessWidget(
                title: "Inscrição confirmada!",
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
      },
    );
  }

  Future<void> showToast(BuildContext context) async {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text(
          'Atenção Adicione uma Imagem!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future<void> getFile() async {
    final ImagePicker _pick = ImagePicker();
    image = await _pick.pickImage(source: ImageSource.gallery);
    if (image != null) {
      nameImage.value = image!.name;
      path = image!.path;
      isData.value = true;
    } else {
      isData.value = false;
    }
  }

  Future<void> upload(String path, BuildContext context) async {
    if (path.isEmpty) {
      showToast(context);
      return;
    }
    Navigator.pop(context);
    modalStatusEnum.value = ModalStatusEnum.loading;
    showModalLoadandSuccess(context);
    if (isData.value) {
      File file = File(path);
      try {
        String ref = 'images/img-${DateTime.now()}.jpg';
        var data = await storage.ref(ref).putFile(file);
        data != null
            ? modalStatusEnum.value = ModalStatusEnum.success
            : modalStatusEnum.value = ModalStatusEnum.failure;
      } on FirebaseException catch (e) {
        modalStatusEnum.value = ModalStatusEnum.failure;
        throw Exception('Error no upload: ${e.code}');
      }
    }
  }

  Future<void> showModalLoadandSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return ValueListenableBuilder(
          valueListenable: modalStatusEnum,
          builder: (_, ModalStatusEnum statusModal, __) {
            if (statusModal.isLoading) {
              return const ModalLoadingWidget();
            }
            return ModalSuccessWidget(
              title: "Arquivo enviado com sucesso!",
              onClose: () {
                setInitialStatusModal(ctx);
              },
            );
          },
        );
      },
    );
  }

  Future<void> genericModal(
      BuildContext context, String title, String icon, String text) {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide.none,
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return ProjectGameRulesWidget(
          text: text,
          icon: icon,
          title: title,
        );
      },
    );
  }
}
