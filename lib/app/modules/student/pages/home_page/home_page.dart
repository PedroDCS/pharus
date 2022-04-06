import 'package:flutter/material.dart';
import 'widgets/avatar_widget.dart';
import 'widgets/news_feed_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 31.33, 16, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 26.33, left: 33.1 - 16),
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/pharos_icon.png',
                      height: 51.33, width: 36.56),
                ),
                const AvatarWidget(),
                const NewsFeedWidget(),
              ],
            )),
      ),
    );
  }
}
