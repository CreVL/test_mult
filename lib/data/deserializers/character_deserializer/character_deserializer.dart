import '../../../domain/entities/character.dart';
import '../../../domain/entities/characters_data.dart';
import '../../../domain/entities/info.dart';
import '../../../internal/serializers/deserializer.dart';
import '../../../internal/serializers/json_deserializer.dart';

class CharacterDeserializer implements JsonDeserializer<Character> {
  final Deserializer<Info, Map<String, dynamic>> infoDeserializer;
  final Deserializer<CharactersData, Map<String, dynamic>>
      charactersMultDeserializer;

  CharacterDeserializer({
    required this.infoDeserializer,
    required this.charactersMultDeserializer,
  });

  @override
  Character call(Map<String, dynamic> json) {
    return Character(
      info: json['info'] != null ? infoDeserializer.call(json['info']) : null,
      results: json['results'] != null
          ? (json['results'] as List<dynamic>)
              .map((v) => charactersMultDeserializer.call(v))
              .toList()
          : null,
    );
  }
}
