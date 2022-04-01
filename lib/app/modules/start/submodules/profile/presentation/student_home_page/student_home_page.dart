import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("Area do Aluno"),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed("edit");
              },
              child: Text("Editar perfil do aluno"),
            )
          ],
        ));
  }
}
