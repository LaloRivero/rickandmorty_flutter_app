import '../model/character.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const apiUrl = 'https://rickandmortyapi.com/api/character/?page=1';

class GetCharactersAPI {
  // This class has two future methods
  // getCharacters that fetch a list of characters
  // getCharacter that receive an id and fetch and specific character

   Future getCharacters() async{
     List <Character> characters = [];
     final request = await http.get(Uri.parse(apiUrl));
     dynamic response;
     if (request.statusCode == 200) {
        response = jsonDecode(request.body);
     }else{
       throw Exception('Fail to fetch Characters');
     }

     for(var c in response['results']){
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