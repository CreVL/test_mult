import 'package:mobx/mobx.dart';
import 'package:test_mult/application/usecases/get_character_usecase/get_character_usecase.dart';

import '../../../application/usecases/get_episode_by_id/get_episode_by_id.dart';
import '../../../domain/entities/character_episode.dart';
import '../../../domain/entities/characters_data.dart';

part 'character_controller.g.dart';

class CharacterController = CharacterControllerBase with _$CharacterController;

abstract class CharacterControllerBase with Store {
  final GetCharactersDataUsecase getCharactersDataUsecase;
  final GetCharacterEpisodeUsecase getCharacterEpisodeUsecase;

  CharacterControllerBase(
    this.getCharactersDataUsecase,
    this.getCharacterEpisodeUsecase,
  );

  @observable
  List<CharactersData>? character;

  @observable
  List<CharacterEpisode>? episode;

  @observable
  bool isLoading = false;

  @action
  Future<void> getCharacter() async {
    isLoading = true;
    character = await getCharactersDataUsecase.call();
    isLoading = false;
  }

  @action
  Future<void> getEpisode(int characterId) async {
    isLoading = true;
    episode = await getCharacterEpisodeUsecase.call(characterId);
    isLoading = false;
  }
}
