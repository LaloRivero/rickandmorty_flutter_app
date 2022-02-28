import '../model/character.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:async';
import 'dart:convert';

Random random = Random();
const apiUrl = 'https://rickandmortyapi.com/api/character/?page=';

class GetCharactersAPI {
  // This class has two future methods
  // getCharacters that fetch a list of characters
  // getCharacter that receive an id and fetch and specific character
  final num =  random.nextInt(42);
   Future getCharacters() async{
     List <Character> characters = [];
     final request = await http.get(Uri.parse("$apiUrl$num"));
     dynamic response;
     if (request.statusCode == 200) {
        response = jsonDecode(request.body);
     }else{
       throw Exception('Fail to fetch Characters');
     }

     for(var c in response['results']){
       final firstCharacterSeen = await http.get(Uri.parse(c['episode'][0]));
       dynamic firstSeen;
       if (firstCharacterSeen.statusCode == 200){
         firstSeen = jsonDecode(firstCharacterSeen.body);
         c['firstSeen']=firstSeen['name'];
       }
       Character character = Character.fromJson(c);
       characters.add(character);
     }

     return characters;
   }

   Future <Character> getCharacter(String id) async{
     final request = await http.get(Uri.parse('$apiUrl/$id'));
     if (request.statusCode == 200){
       return Character.fromJson(jsonDecode(request.body));
     }else{
       throw Exception('Failed to fetch the character with id: $id');
     }
   }

}