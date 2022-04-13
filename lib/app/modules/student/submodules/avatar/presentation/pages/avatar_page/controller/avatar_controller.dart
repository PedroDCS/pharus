import 'package:flutter/cupertino.dart';

class AvatarController {
  var size = ValueNotifier<double>(0.55);
  final double initialSize = 0.55;
  final double expandSize = 0.7;
  bool get initialSizeValue => size.value == initialSize;

  var iconTypeActive = ValueNotifier<String>('assets/icons/expand.png');

  var assetImgAvatar = ValueNotifier<String>('assets/images/avatar_1.svg');

  Future<void> animatedSize() async {
    size.value = initialSizeValue ? expandSize : initialSize;
    iconType(initialSizeValue);
  }

  Future<void> iconType(bool initialSizeValue) async {
    iconTypeActive.value = initialSizeValue 
        ? 'assets/icons/expand.png'
        : 'assets/icons/retract_icon_bg.png';
  }
  Future<void> onChangeAvatar( avatar) async{
    assetImgAvatar.value = avatar['avatar']['avatar_img'];
  }


}
