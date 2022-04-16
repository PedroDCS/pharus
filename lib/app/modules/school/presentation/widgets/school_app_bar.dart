import 'package:flutter/material.dart';

class SchoolAppBarWidget extends StatelessWidget {
  const SchoolAppBarWidget({
    Key? key,
    required this.title,
    required this.imageAsset,
    required this.barColor,
    required this.textColor,
    this.buttomGoBack = true,
  }) : super(key: key);
  final String title;
  final String imageAsset;
  final Color barColor;
  final Color textColor;
  final bool buttomGoBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: buttomGoBack
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //Modular.to.canPop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )
            : null,
        automaticallyImplyLeading: buttomGoBack,
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: barColor,
        elevation: 0,
        actions: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(right: 19),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage(imageAsset)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ]);
  }
}
