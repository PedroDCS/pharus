import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/school_app_bar.dart';
import '../../../domain/entities/project_entity.dart';
import 'widgets/school_project_details_head_widget.dart';
import 'widgets/school_project_game_rules_widget.dart';
import 'widgets/school_project_task_list_widget.dart';

class SchoolProjectDetailsPage extends StatefulWidget {
  const SchoolProjectDetailsPage({
    Key? key,
    required this.project,
  }) : super(key: key);
  final ProjectEntity project;

  @override
  State<SchoolProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<SchoolProjectDetailsPage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  XFile? image;
  var isData = ValueNotifier<bool>(false);
  var nameImage = ValueNotifier<String>('');

  Future<void> _getFile() async {
    final ImagePicker _pick = ImagePicker();
    image = await _pick.pickImage(source: ImageSource.gallery);
    if (image != null) {
      nameImage.value = image!.name;
      isData.value = true;
    } else {
      isData.value = false;
    }
  }

  Future<void> upload(String path) async {
    Navigator.pop(context);
    if (isData.value) {
      File file = File(path);
      try {
        String ref = 'images/img-${DateTime.now()}.jpg';
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
        child: SchoolAppBarWidget(
          title: widget.project.name,
          imageAsset: 'assets/icons/school.png',
          barColor: const Color(0xFFE6E6E6),
        ),
        preferredSize: const Size.fromHeight(60),
      ),
      backgroundColor: const Color(0xFFE6E6E6),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 53, 16, 10),
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFC8C8C8),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SchoolProjectDetailsHeadWidget(
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
                                    MediaQuery.of(context).size.height * 0.80,
                                width:
                                    MediaQuery.of(context).size.width * 0.90),
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return const SchoolProjectGameRulesWidget();
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
                    const SchoolProjectTaskListWidget(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
