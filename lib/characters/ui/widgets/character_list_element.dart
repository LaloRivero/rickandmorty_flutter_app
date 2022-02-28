import 'package:flutter/material.dart';
import 'package:rickandmortyapp/characters/model/character.dart';

class CharacterListElement extends StatefulWidget{
  final character;
  const CharacterListElement ( {Key? key, required this.character}) : super(key: key);

  @override
  _CharacterListElement createState() => _CharacterListElement();
}

class _CharacterListElement extends State<CharacterListElement>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.character.name);
  }
}