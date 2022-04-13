import 'package:flutter/cupertino.dart';

class AvatarController {
  final repository = 'ProjectRepository()';
  var size = ValueNotifier<double>(0.55);
  final double initialSize = 0.55;
  final double expandSize = 0.7;
  bool get initialSizeValue => size.value == initialSize;

  Future<void> animatedSize() async {
    size.value = initialSizeValue ? expandSize : initialSize;
  }

 
}
