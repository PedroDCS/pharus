import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../shared/app_colors/app_colors.dart';
import '../../../../../presentation/widgets/student_app_bar.dart';
import 'controller/avatar_controller.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends ModularState<AvatarPage, AvatarController>
    with TickerProviderStateMixin {
  @override
  void initState() {
    controller.getAtavar(widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.secondaryColor600,
              AppColors.tertiaryColor100,
              AppColors.primaryColor80,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          child: ValueListenableBuilder(
              valueListenable: controller.avatarimage,
              builder: (BuildContext context, String imageasset, _) {
                return StudentAppBarWidget(
                  title: 'Avatar',
                  imageAsset: 'assets/icons/idea.png',
                  barColor: Colors.transparent,
                  buttomGoBack: false,
                  textColor: Colors.white,
                  ontap: () => controller.saveAvatar(widget.email, context),
                );
              }),
          preferredSize: const Size.fromHeight(60),
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
                      builder: (BuildContext context, double size, _) {
                        return _buildAnimatedSize(size);
                      },
                    ),
                    GestureDetector(
                      onTap: controller.animatedSize,
                      child: Container(
                        margin: const EdgeInsets.only(right: 50),
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor:
                              const Color.fromRGBO(182, 182, 182, 1),
                          child: ValueListenableBuilder(
                            valueListenable: controller.iconTypeActive,
                            builder: (_, String iconType, __) {
                              return Image.asset(iconType);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Escolha o seu avatar',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColors.neutralColor10,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: controller.avatar.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: GestureDetector(
                              onTap: () => controller.onChangeAvatar(
                                  controller.avatar[index], widget.email),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    const Color.fromRGBO(182, 182, 182, 1),
                                child: Image.asset(
                                  controller.avatar[index]['avatar']['profile'],
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChild() {
    return ValueListenableBuilder(
        valueListenable: controller.assetImgAvatar,
        builder: (_, String imgAvatar, __) {
          return Image.asset(imgAvatar,
              fit: BoxFit.fitHeight, height: 200, width: 200);
        });
  }

  Widget _buildAnimatedSize(double size) {
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
