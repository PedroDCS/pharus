import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/student/submodules/avatar/presentation/pages/avatar_page/controller/avatar_controller.dart';
import 'package:pharus/app/modules/student/submodules/projects/presentation/widgets/app_bar.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends ModularState<AvatarPage, AvatarController>
    with TickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        child: AppBarWidget(title: 'Avatar'),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ValueListenableBuilder(
                    valueListenable: controller.size,
                    builder: (BuildContext context, double size, _){
                      return _buildAnimatedSize(
                        size
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: controller.animatedSize,
                    child: Container(
                      margin: const EdgeInsets.only(right: 99),
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromRGBO(182, 182, 182, 1),
                        child: Image.asset('assets/icons/expand.png'),
                      ),
                    ),
                  ),
                ],
              ),
              const Text('TEste')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChild() {
    return Image.asset(
      'assets/images/avatar_girl_bg.png',
      fit: BoxFit.fitHeight,
      height: 200,
      width: 200,
    );
  }

  Widget _buildAnimatedSize( double size) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width * size,
        height: MediaQuery.of(context).size.height * size,
        duration: const Duration(milliseconds: 500),
        child: _buildChild(),
      ),
    );
  }
}
