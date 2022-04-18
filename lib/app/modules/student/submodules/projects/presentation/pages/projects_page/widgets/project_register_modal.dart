import 'package:flutter/material.dart';
import 'package:pharus/app/modules/student/submodules/projects/presentation/pages/projects_page/widgets/project_register_button.dart';
import '../../../../../../../../shared/app_colors/app_colors.dart';

class ModalRegisterProject extends StatelessWidget {
  const ModalRegisterProject({
    required this.confirmRegistration,
    Key? key,
  }) : super(key: key);
  final Function() confirmRegistration;
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
          Text("Confirmar inscrição"),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Você deseja se inscrever no projeto ”Introdução a física”?"),
          const SizedBox(
            height: 30,
          ),
          ProjectButtonWidget(
            nameButton: 'Sim, quero me inscrever',
            onPressed: confirmRegistration,
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
