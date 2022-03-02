import 'package:flutter/material.dart';
import '../screens/character_details.dart';
import 'character_status.dart';


class CharacterListElement extends StatelessWidget {
  final character;

  const CharacterListElement({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textSize = 14.0;
    const titleText = 18.0;

    final characterImage = ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
      child: Image(
        image: NetworkImage(character.image),
        height: 180,
      ),
    );

    final characterName = SizedBox(
        width: 250,
        child: Text(character.name,
            style: const TextStyle(fontSize: titleText, fontWeight: FontWeight.bold)));

    final lastKnowLocation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: const Text(
              "Last know Location:",
              style: TextStyle(
                fontSize: textSize,
                color: Color.fromARGB(255, 158, 158, 158),
              ),
            )),
        Text(
          character.location,
          style: const TextStyle(fontSize: textSize),
        )
      ],
    );

    final firstSeenEpisode = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: const Text(
              "First seen in:",
              style: TextStyle(
                fontSize: textSize,
                color: Color.fromARGB(255, 158, 158, 158),
              ),
            )),
        Text(
          character.firstSeen,
          style: const TextStyle(fontSize: textSize),
        )
      ],
    );

    return InkWell(
        child: Container(
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 60, 62, 68),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                characterImage,
                Container(
                  margin: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterName,
                      CharacterStatus(textSize: textSize, character: character,),
                      lastKnowLocation,
                      firstSeenEpisode,
                    ],
                  ),
                )
              ],
            )),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetails(character: character)));
        });
  }
}
