import '../../../domain/entities/character_episode.dart';
import '../../../internal/serializers/json_deserializer.dart';

class CharacterEpisodeDeserializer
    implements JsonDeserializer<CharacterEpisode> {
  @override
  CharacterEpisode call(Map<String, dynamic> scheme) {
    return CharacterEpisode(
      id: scheme['id'],
      name: scheme['name'],
      airDate: scheme['air_date'],
      episode: scheme['episode'],
      characters: List<String>.from(scheme['characters']),
      url: scheme['url'],
      created: scheme['created'],
    );
  }
}
