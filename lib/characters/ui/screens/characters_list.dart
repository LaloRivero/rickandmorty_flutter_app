import 'package:flutter/material.dart';
import '../../repository/get_characters_api.dart';
import '../widgets/character_list_element.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getCharactersData = GetCharactersAPI();
    final characters = getCharactersData.getCharacters();

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rick and Morty app'),
        ),
        body: Center(
          child: Card(
            child: FutureBuilder(
              future: characters,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return CharacterListElement(character:snapshot.data[i]);
                      });
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}