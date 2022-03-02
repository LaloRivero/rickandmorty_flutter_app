import 'package:flutter/material.dart';
import '../widgets/character_status.dart';
import '../widgets/first_seen.dart';
import '../widgets/last_location.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({Key? key, required this.character}) : super(key: key);
  final character;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    const textSize = 24.0;

    final characterImage = ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Image(
        image: NetworkImage(character.image),
      ),
    );

    final characterName = Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Text("${character.name}", style: const TextStyle(fontSize: 28)),
    );

    final characterGender = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(
              top: 25,
              bottom: 5,
            ),
            child: const Text(
              "Gender:",
              style: TextStyle(
                fontSize: textSize,
                color: Color.fromARGB(255, 158, 158, 158),
              ),
            )),
        Text(
          character.gender,
          style: const TextStyle(fontSize: textSize),
        )
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("${character.name}"),
        ),
        body: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 60, 62, 68),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: characterImage,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                    left: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterName,
                      CharacterStatus(
                        textSize: 20.0,
                        character: character,
                      ),
                      characterGender,
                      FirstSeen(
                        textSize: textSize,
                        character: character,
                      ),
                      LastLocation(
                        textSize: textSize,
                        character: character,
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
