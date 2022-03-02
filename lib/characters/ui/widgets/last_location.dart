import 'package:flutter/material.dart';

class LastLocation extends StatelessWidget {
  const LastLocation({Key? key, this.textSize, this.character}) : super(key: key);
  final textSize;
  final character;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: Text(
              "Last know Location:",
              style: TextStyle(
                fontSize: textSize,
                color: const Color.fromARGB(255, 158, 158, 158),
              ),
            )),
        Text(
          character.location,
          style: TextStyle(fontSize: textSize),
        )
      ],
    );
  }
}
