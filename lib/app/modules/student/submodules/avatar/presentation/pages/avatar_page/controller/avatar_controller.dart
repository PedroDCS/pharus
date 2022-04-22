import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../../../widgets/custom_modal_loading_widget.dart';
import '../../../../../../widgets/custom_modal_success_widget.dart';
import '../../../../../projects/presentation/pages/project_details_page/state_page/modal_state_enum.dart';

class AvatarController {
  var size = ValueNotifier<double>(0.55);
  final double initialSize = 0.55;
  final double expandSize = 0.7;
  bool get initialSizeValue => size.value == initialSize;
  var modalStatusEnum = ValueNotifier<ModalStatusEnum>(ModalStatusEnum.initial);
  var iconTypeActive = ValueNotifier<String>('assets/icons/icon-expand.png');

  var assetImgAvatar =
      ValueNotifier<String>('assets/avatar/Property 1=Avatar_01.png');

  ValueNotifier<String> avatarimage =
      ValueNotifier("assets/avatar/Property 1=1.png");

  Future<void> animatedSize() async {
    size.value = initialSizeValue ? expandSize : initialSize;
    iconType(initialSizeValue);
  }

  Future<void> iconType(bool initialSizeValue) async {
    iconTypeActive.value = initialSizeValue
        ? 'assets/icons/icon-expand.png'
        : 'assets/icons/icon-retract.png';
  }

  getAtavar(email) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    assetImgAvatar.value = profile['avatar'];
    avatarimage.value = profile['avatarCircle'];
    await profilesBox.close();
  }

  saveAvatar(email, context) async {
    modalStatusEnum.value = ModalStatusEnum.loading;
    showModalLoadandSuccess(context);
    await Future.delayed(const Duration(seconds: 1));

    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    profile['avatarCircle'] = avatarimage.value;
    profile['avatar'] = assetImgAvatar.value;
    await profilesBox.put(email, profile);
    await profilesBox.close();
    modalStatusEnum.value = ModalStatusEnum.success;
  }

  Future<void> showModalLoadandSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return ValueListenableBuilder(
          valueListenable: modalStatusEnum,
          builder: (_, ModalStatusEnum statusModal, __) {
            if (statusModal.isLoading) {
              return const ModalLoadingWidget();
            }
            return ModalSuccessWidget(
              title: "Avatar Salvo!",
              onClose: () {
                Navigator.of(ctx).pop();
              },
            );
          },
        );
      },
    );
  }

  Future<void> onChangeAvatar(avatar, email) async {
    assetImgAvatar.value = avatar['avatar']['avatar_img'];
    avatarimage.value = avatar['avatar']['profile'];

    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    profile['avatarCircle'] = avatarimage.value;
    profile['avatar'] = assetImgAvatar.value;
    await profilesBox.put(email, profile);

    await profilesBox.close();
  }

  final List<dynamic> avatar = [
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=1.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_01.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=2.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_02.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=3.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_03.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=4.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_04.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=5.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_05.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=6.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_06.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=7.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_07.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=8.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_08.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=9.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_09.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=10.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_10.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=11.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_11.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=12.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_12.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=13.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_13.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=14.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_14.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=15.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_15.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=16.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_16.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=17.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_17.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=18.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_18.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=19.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_19.png'
      }
    },
    {
      'avatar': {
        'profile': 'assets/avatar/Property 1=20.png',
        'avatar_img': 'assets/avatar/Property 1=Avatar_20.png'
      }
    },
  ];
}
