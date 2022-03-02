import 'package:flutter/material.dart';

class CharacterStatus extends StatelessWidget{
  const CharacterStatus ({Key? key, this.textSize, this.character}) : super(key: key);
  final textSize;
  final character;
  @override
  Widget build(BuildContext context) {
    dynamic statusIndicator() {
      if (character.status == 'Alive') {
        return Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          height: 12,
          width: 12,
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
        );
      } else {
        return Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          height: 12,
          width: 12,
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
        );
      }
    }

    return Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: Row(
          children: [
            statusIndicator(),
            Text(
              "${character.status} - ",
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
            Text(
              character.species,
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
          ],
        ));
  }
}