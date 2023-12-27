import '../../../domain/entities/characters_data.dart';
import '../../../domain/entities/origin.dart';
import '../../../internal/serializers/deserializer.dart';
import '../../../internal/serializers/json_deserializer.dart';

class CharactersDataDeserializer implements JsonDeserializer<CharactersData> {
  final Deserializer<Origin, Map<String, dynamic>> originDeserializer;

  CharactersDataDeserializer({required this.originDeserializer});

  @override
  CharactersData call(Map<String, dynamic> scheme) {
    return CharactersData(
      id: scheme['id'],
      name: scheme['name'],
      status: scheme['status'],
      species: scheme['species'],
      type: scheme['type'],
      gender: scheme['gender'],
      origin: scheme['origin'] != null
          ? originDeserializer.call(scheme['origin'])
          : null,
      location: scheme['location'] != null
          ? originDeserializer.call(scheme['location'])
          : null,
      image: scheme['image'],
      episode: List<String>.from(scheme['episode']),
      url: scheme['url'],
      created: scheme['created'],
    );
  }
}
