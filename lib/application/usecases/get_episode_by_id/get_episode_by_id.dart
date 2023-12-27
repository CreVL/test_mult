import '../../../domain/entities/character_episode.dart';
import '../../repository/characters_repository.dart';

class GetCharacterEpisodeUsecase {
  final CharacterRepository _repository;

  const GetCharacterEpisodeUsecase(this._repository);

  Future<List<CharacterEpisode>?> call(int characterId) {
    return _repository.getEpisode(characterId);
  }
}
