import '../../../data/repositories/characters_repository.dart';
import '../../../domain/entities/character.dart';

class GetCharactersMultUsecase {
  final CharacterRepository _repository;

  const GetCharactersMultUsecase(this._repository);

  Future<CharactersMult> call() {
    return _repository.getCharacter();
  }
}