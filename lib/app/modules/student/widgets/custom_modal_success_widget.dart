import 'package:flutter/material.dart';
import 'package:pharus/app/modules/student/submodules/projects/presentation/pages/project_details_page/state_page/modal_state_enum.dart';

class ModalSuccessWidget extends StatelessWidget {
  const ModalSuccessWidget(
      {
      required this.onClose,
      required this.modalState,
      Key? key})
      : super(key: key);
  final ValueNotifier<ModalStatusEnum> modalState;
  final Function() onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      decoration: BoxDecoration(
        color: const Color(0xFFE1E1E1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/check.png'),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Arquivo enviado com sucesso!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: onClose,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFC3C3C3),
                padding:
                    const EdgeInsets.symmetric(horizontal: 27.5, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: const Text(
                "Fechar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
