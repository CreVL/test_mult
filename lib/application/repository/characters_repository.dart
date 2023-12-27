import 'package:test_mult/domain/entities/character_episode.dart';

import '../../domain/entities/characters_data.dart';

abstract class CharacterRepository {
  Future<List<CharactersData>?> getCharacters();

  Future<List<CharacterEpisode>?> getEpisode(int characterId);
}
