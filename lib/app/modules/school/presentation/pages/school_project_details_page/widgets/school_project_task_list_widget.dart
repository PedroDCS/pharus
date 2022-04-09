import 'package:flutter/material.dart';

class SchoolProjectTaskListWidget extends StatelessWidget {
  const SchoolProjectTaskListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Lista de tarefas:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: double.infinity,
          height: 220,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: ((context, index) {
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.all(0),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  title: Text(
                    "Tarefa ${index + 1}",
                    style: const TextStyle(decoration: TextDecoration.none),
                  ),
                  onChanged: (bool? value) {},
                );
              })),
        ),
        const Center(
          child: Text(
            "Completadas 3 de 4 tarefas (75%)",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 32),
          width: double.infinity,
          height: 22,
          child: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: LinearProgressIndicator(
              color: Color(0xFFB6B6B6),
              backgroundColor: Colors.white,
              minHeight: 22,
              value: 0.75,
            ),
          ),
        ),
      ],
    );
  }
}
