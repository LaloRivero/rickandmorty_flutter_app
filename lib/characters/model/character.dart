/// This class describes the data that will be use from rickandmortyapi

class Character {
  final String id, name, status, species, image, origin, location;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json){
    return Character(
        id: json['id'].toString(),
        name: json['name'],
        status: json['status'],
        species: json['species'],
        origin: json['origin']['name'],
        location: json['location']['name'],
        image: json['image']
    );
  }
}