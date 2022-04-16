import 'package:flutter/material.dart';
import 'package:pharus/app/modules/student/submodules/projects/presentation/pages/project_details_page/state_page/modal_state_enum.dart';

class ModalLoadingWidget extends StatelessWidget {
  const ModalLoadingWidget(
      {Key? key})
      : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            valueColor:  AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
