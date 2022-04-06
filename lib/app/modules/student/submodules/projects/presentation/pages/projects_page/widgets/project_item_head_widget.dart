import 'package:flutter/material.dart';

class ProjectItemHeadWidget extends StatelessWidget {
  const ProjectItemHeadWidget({
    Key? key,
    required this.name,
    required this.mentor,
  }) : super(key: key);
  final String name;
  final String mentor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Projeto: $name',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Mentor: $mentor',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Descrição:',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
