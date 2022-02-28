import 'package:flutter/material.dart';
import 'package:rickandmortyapp/characters/model/character.dart';

class CharacterListElement extends StatefulWidget {
  final character;

  const CharacterListElement({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterListElement createState() => _CharacterListElement();
}

class _CharacterListElement extends State<CharacterListElement> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final characterImage = ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
      child: Image(
        image: NetworkImage(widget.character.image),
        height: 180,
      ),
    );

    final characterName = SizedBox(
        width: 250,
        child: Text(widget.character.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));

    dynamic statusIndicator() {
      if (widget.character.status == 'Alive') {
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

    final characterStatus = Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: Row(
          children: [
            statusIndicator(),
            Text("${widget.character.status} - ",
            style: const TextStyle(
              fontSize: 18,
            ),),
            Text(widget.character.species, style: const TextStyle(
              fontSize: 18,
            ),),
          ],
        ));

    final lastKnowLocation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
            bottom: 10,
          ),
            child: const Text(
          "Last know Location:",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 158, 158, 158),
          ),
        )),
        Text(widget.character.location,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );

    return Container(
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
                  characterStatus,
                  lastKnowLocation,
                ],
              ),
            )
          ],
        ));
  }
}
