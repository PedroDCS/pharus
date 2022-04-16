import 'package:flutter/material.dart';

class ProjectDetailsHeadWidget extends StatelessWidget {
  const ProjectDetailsHeadWidget({
    Key? key,
    required this.mentor,
    required this.description,
  }) : super(key: key);
  final String mentor;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: Text(
                'Mentor: $mentor',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.all(0),
              icon: const ImageIcon(
                AssetImage('assets/icons/icon-envelope.png'),
                color: Colors.black,
              ),
              color: Colors.blue,
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 16),
          child: Text(
            "Descrição:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
