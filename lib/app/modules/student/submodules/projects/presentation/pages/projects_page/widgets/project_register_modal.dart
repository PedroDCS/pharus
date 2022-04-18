import 'package:flutter/material.dart';

import '../../../../../../../../domain/entities/project_entity.dart';
import '../../../../../../../../shared/app_colors/app_colors.dart';
import '../controller/subscrive_bottom_controller.dart';
import 'project_register_button.dart';

class ModalRegisterProject extends StatelessWidget {
  const ModalRegisterProject({
    Key? key,
    required this.project,
    required this.email,
    required this.subcontroller,
    required this.confirmRegistration,
  }) : super(key: key);
  final Future<void> Function(ProjectEntity, String, SubscriveController)
      confirmRegistration;
  final ProjectEntity project;
  final String email;
  final SubscriveController subcontroller;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: AppColors.primaryColor30,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Confirmar inscrição", style: TextStyle(fontSize: 16)),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Você deseja se inscrever no projeto "${project.name}"?'),
          const SizedBox(
            height: 30,
          ),
          ProjectButtonWidget(
            nameButton: 'Sim, quero me inscrever',
            onPressed: () => confirmRegistration(project, email, subcontroller),
            outlineActive: false,
          ),
          const SizedBox(
            height: 30,
          ),
          ProjectButtonWidget(
            nameButton: 'Não quero, mudei de idéia',
            onPressed: () => Navigator.of(context).pop(),
            outlineActive: true,
          ),
        ],
      ),
    );
  }
}
