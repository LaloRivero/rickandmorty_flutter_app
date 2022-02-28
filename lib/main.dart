import 'package:flutter/material.dart';
import './characters/ui/screens/characters_list.dart';

const Color lightDark = Color.fromARGB(255, 36, 40, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: lightDark,
      ),
      home: const CharactersList(),
    );
  }
}