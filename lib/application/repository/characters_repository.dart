import '../../domain/entities/characters_data.dart';

abstract class CharacterRepository {
  Future<List<CharactersData>?> getCharacters();
}
