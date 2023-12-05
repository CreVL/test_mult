import 'package:mobx/mobx.dart';
import 'package:test_mult/application/usecases/get_character_usecase/get_character_usecase.dart';

import '../../../domain/entities/character.dart';

part 'character_controller.g.dart';

class CharacterController = CharacterControllerBase
    with _$CharacterController;

abstract class CharacterControllerBase with Store {
  final GetCharactersMultUsecase _getCharactersUsecase;

  CharacterControllerBase(this._getCharactersUsecase);

  @observable
  bool isLoading = false;

  @observable
  late CharactersMult character;

  @observable
  CharactersMult? observableCharacter;


  @action
  Future<void> getCharacters() async {
    isLoading = true;
    character = await _getCharactersUsecase();
    isLoading = false;
  }
}
