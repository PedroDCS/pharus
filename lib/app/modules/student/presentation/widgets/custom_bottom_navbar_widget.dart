import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/app_colors/app_colors.dart';
import '../controller/custom_bottom_navbar_controller.dart';

class CustomBottomnavBarWidget extends StatefulWidget {
  const CustomBottomnavBarWidget({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<CustomBottomnavBarWidget> createState() =>
      _CustomBottomnavBarWidgetState();
}

class _CustomBottomnavBarWidgetState extends ModularState<
    CustomBottomnavBarWidget, CustomBottomNavbarController> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (id) => setState(() {
        controller.changePage(id: id, email: widget.email);
      }),
      currentIndex: controller.index,
      unselectedItemColor: Colors.white,
      backgroundColor: AppColors.secondaryColor600,
      fixedColor: AppColors.neutralColor10,
      enableFeedback: true,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon1.png'), size: 30),
          label: '',
          activeIcon: ImageIcon(
            AssetImage('assets/icons/icon1-selected.png'),
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon2.png'), size: 30),
          label: '',
          activeIcon: ImageIcon(
            AssetImage('assets/icons/icon2-selected.png'),
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon3.png'), size: 30),
          label: '',
          activeIcon: ImageIcon(
            AssetImage('assets/icons/icon3-selected.png'),
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon4.png'), size: 30),
          label: '',
          activeIcon: ImageIcon(
            AssetImage('assets/icons/icon4-selected.png'),
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/icon55.png'), size: 30),
          label: '',
          activeIcon: ImageIcon(
            AssetImage('assets/icons/icon5-selected.png'),
            size: 30,
          ),
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
