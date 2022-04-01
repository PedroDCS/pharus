import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../widgets/custom_bottom_navbar_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: CustomBottomnavBarWidget(),
    );
  }
}
