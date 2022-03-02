import 'package:flutter/material.dart';

class FirstSeen extends StatelessWidget{
  const FirstSeen ({Key? key, this.textSize, this.character}) : super(key: key);
  final textSize;
  final character;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child:  Text(
              "First seen in:",
              style: TextStyle(
                fontSize: textSize,
                color: const Color.fromARGB(255, 158, 158, 158),
              ),
            )),
        Text(
          character.firstSeen,
          style: TextStyle(fontSize: textSize),
        )
      ],
    );
  }
}