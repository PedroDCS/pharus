import 'package:flutter/material.dart';

class ProjectPartnershipWidget extends StatelessWidget {
  const ProjectPartnershipWidget({
    Key? key,
    required this.urlParter,
  }) : super(key: key);

  final String urlParter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Parceria: ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          Image.network(
            urlParter,
            width: 66,
            height: 66,
          )
        ],
      ),
    );
  }
}
