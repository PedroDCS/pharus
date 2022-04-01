import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controller/custom_bottom_navbar_controller.dart';

class CustomBottomnavBarWidget extends StatefulWidget {
  const CustomBottomnavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomnavBarWidget> createState() =>
      _CustomBottomnavBarWidgetState();
}

class _CustomBottomnavBarWidgetState extends ModularState<
    CustomBottomnavBarWidget, CustomBottomNavbarController> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (id) => controller.changePage(id),
      currentIndex: controller.index,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon1.png'), size: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon2.png'), size: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon3.png'), size: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon4.png'), size: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon5.png'), size: 30),
          label: '',
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      //backgroundColor: Color(0xFFC3C3C3),
    );
  }
}
