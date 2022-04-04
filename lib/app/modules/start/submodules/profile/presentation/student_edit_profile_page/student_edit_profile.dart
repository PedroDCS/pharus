import 'package:flutter/material.dart';

class StudentEditProfile extends StatelessWidget {
  const StudentEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text("Editart Perfil Do Aluno\n----"),
            const EditInputAreaWidget(
              areaname: 'Nome',
            ),
            const EditInputAreaWidget(
              areaname: 'Data De nascimento',
            ),
            const EditInputAreaWidget(
              areaname: 'Genero',
            ),
            const EditInputAreaWidget(
              areaname: 'Celular',
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}

//edit_input_area_widget
class EditInputAreaWidget extends StatelessWidget {
  const EditInputAreaWidget({
    Key? key,
    required this.areaname,
  }) : super(key: key);
  final String areaname;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          areaname,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: areaname,
          ),
        ),
      ],
    );
  }
}
