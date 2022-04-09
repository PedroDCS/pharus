import 'package:flutter/material.dart';
import 'widgets/home_student_body_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 32),
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 110),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE1E1E1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(180),
                        topRight: Radius.circular(180)),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.85,
                  padding: const EdgeInsets.fromLTRB(18, 27, 10, 20),
                  child: Column(children: const []),
                ),
                const HomeStudentBodyWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
