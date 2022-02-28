import 'package:flutter/material.dart';
import '../../repository/get_characters_api.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class CharactersList extends StatefulWidget {
  const CharactersList({Key? key}) : super(key: key);

  @override
  _Characters createState()=> _Characters();
}

class _Characters extends State<CharactersList> {
  @override
  void initState() {
    super.initState();
  }
  final getCharactersData = GetCharactersAPI();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Card(
            child: FutureBuilder(
              future: getCharactersData.getCharacters(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: Image(
                            image: NetworkImage(snapshot.data[i].image),),
                          title: Text(snapshot.data[i].name),
                          subtitle: Text(snapshot.data[i].status),
                        );
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