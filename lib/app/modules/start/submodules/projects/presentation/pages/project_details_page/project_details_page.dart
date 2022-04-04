import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharus/app/modules/start/submodules/projects/presentation/pages/project_details_page/widgets/project_modal_upload_files.dart';
import '../../../domain/entities/project_entity.dart';
import '../../widgets/app_bar.dart';
import 'widgets/project_details_head_widget.dart';
import 'widgets/project_game_rules_widget.dart';
import 'widgets/project_task_list_widget.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({
    Key? key,
    required this.project,
  }) : super(key: key);
  final ProjectEntity project;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  XFile? image;
  var isData = ValueNotifier<bool>(false);
  var nameImage = ValueNotifier<String>('');

  Future<void> _getFile() async {
    final ImagePicker _pick = ImagePicker();
    image = await _pick.pickImage(source: ImageSource.gallery);
    if(image != null){
      nameImage.value = image!.name;
      isData.value = true;
    }else{
      isData.value = false;
    }
  }

  Future<void> upload(String path) async {
    Navigator.pop(context);
    if (isData.value) {
      File file = File(path);
      try {
        String ref =
            'images/img-${DateTime.now()}.jpg';
        var data = await storage.ref(ref).putFile(file);
        // String url = await data.ref.getDownloadURL();
      } on FirebaseException catch (e) {
        throw Exception('Error no upload: ${e.code}');
      }
    }
  }

  void clearData() {
    isData.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(title: widget.project.name),
        preferredSize: const Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 53, 16, 10),
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE1E1E1),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectDetailsHeadWidget(
                      mentor: widget.project.mentor,
                      description: widget.project.description,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(top: 32, bottom: 32),
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            constraints: BoxConstraints.tightFor(
                                height:
                                    MediaQuery.of(context).size.height * 0.60,
                                width:
                                    MediaQuery.of(context).size.width * 0.90),
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return const ProjectGameRulesWidget();
                            },
                          );
                        },
                        child: const Text(
                          "Veja aqui as regras do projeto",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    const ProjectTaskListWidget(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            elevation: 0,
                            backgroundColor: const Color(0xFFE1E1E1),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                                side: BorderSide(color: Colors.white)),
                            context: context,
                            builder: (BuildContext context) {
                              return ModalUploadFiles(
                                clearData: clearData,
                                getFile: _getFile,
                                imageName: nameImage,
                                isFile: isData,
                                uploadFiles: () => upload(image!.path),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(195),
                          minimumSize: const Size.square(44),
                          primary: const Color(0xFFC3C3C3),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 27.5, vertical: 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: const Text(
                          "Enviar Arquivos",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
