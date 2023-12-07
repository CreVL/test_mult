import '../../domain/entities/characters_mult.dart';

abstract class CharacterRepository {
  Future<List<CharactersMult>?> getCharacters();
}
