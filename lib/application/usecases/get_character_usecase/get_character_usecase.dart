import '../../repository/characters_repository.dart';
import '../../../domain/entities/characters_data.dart';

class GetCharactersDataUsecase {
  final CharacterRepository _repository;

  const GetCharactersDataUsecase(this._repository);

  Future<List<CharactersData>?> call() {
    return _repository.getCharacters();
  }
}
