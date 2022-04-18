import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/student/presentation/widgets/student_app_bar.dart';
import 'package:pharus/app/modules/student/submodules/avatar/presentation/pages/avatar_page/controller/avatar_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../shared/app_colors/app_colors.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends ModularState<AvatarPage, AvatarController>
    with TickerProviderStateMixin {
  final List<dynamic> avatar = [
    {
      'avatar': {
        'profile': 'assets/images/profile_avatar_1.png',
        'avatar_img': 'assets/images/avatar_1.svg'
      }
    },
    {
      'avatar': {
        'profile': 'assets/images/profile_avatar_2.png',
        'avatar_img': 'assets/images/avatar_2.svg'
      }
    },
    {
      'avatar': {
        'profile': 'assets/images/profile_avatar_3.png',
        'avatar_img': 'assets/images/avatar_3.svg'
      }
    },
    {
      'avatar': {
        'profile': 'assets/images/profile_avatar_4.png',
        'avatar_img': 'assets/images/avatar_4.svg'
      }
    },
    {
      'avatar': {
        'profile': 'assets/images/profile_avatar_5.png',
        'avatar_img': 'assets/images/avatar_5.svg'
      }
    },
  ];
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
        appBar: const PreferredSize(
          child: StudentAppBarWidget(
            title: 'Avatar',
            imageAsset: 'assets/images/perfil_default.png',
            barColor: Colors.transparent,
            buttomGoBack: false,
            textColor: Colors.white,
          ),
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
                Container(
                  height: 150,
                  child: ListView.builder(
                      itemCount: avatar.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: GestureDetector(
                              onTap: () =>
                                  controller.onChangeAvatar(avatar[index]),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    const Color.fromRGBO(182, 182, 182, 1),
                                child: Image.asset(
                                  avatar[index]['avatar']['profile'],
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
          return SvgPicture.asset(
            imgAvatar,
            fit: BoxFit.fitHeight,
            height: 200,
            width: 200,
          );
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
